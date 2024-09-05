//
//  DataService.swift
//  PokeDex Classic
//
//  Created by Diego Rodriguez on 4/9/24.
//
import Foundation

class DataService {
    private let baseURL = "https://pokeapi.co/api/v2/"

    // Fetches Pokemon by Name or ID
    func fetchPokemonDetails(for nameOrId: String) async throws -> Pokemon {
        let urlString = "\(baseURL)pokemon/\(nameOrId.lowercased())"
        return try await performRequest(urlString: urlString)
    }

    // Gets a list of the first 151 Pokemon with all the details
    func fetchAllPokemon() async throws -> [Pokemon] {
        let urlString = "\(baseURL)pokemon?limit=151" // We only need first generation Pokemon
        let listResponse: PokemonListResponse = try await performRequest(urlString: urlString)
        
        //default endpoint only returns name and url, so we need to fetch all details to display PokemonCards on ListView
        return try await fetchDetailsForPokemonList(listResponse.results)
    }

    // Fetch details for every Pokemon on the list
    private func fetchDetailsForPokemonList(_ pokemonList: [PokemonPartial]) async throws -> [Pokemon] {
        let pokemonDetails = try await withThrowingTaskGroup(of: Pokemon.self, body: { group in
            var details: [Pokemon] = []
            for pokemon in pokemonList {
                group.addTask {
                    return try await self.fetchPokemonDetails(for: pokemon.name)
                }
            }
            for try await detail in group {
                details.append(detail)
            }
            return details.sorted { $0.id < $1.id }
        })
        return pokemonDetails
    }

    // Performs an API request using async/await
    private func performRequest<T: Decodable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw DataError.invalidUrl
        }

        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw DataError.invalidResponse
        }

        return try JSONDecoder().decode(T.self, from: data)
    }

    enum DataError: Error {
        case invalidUrl
        case noData
        case decodingError
        case noApiKey
        case invalidResponse
    }
}
