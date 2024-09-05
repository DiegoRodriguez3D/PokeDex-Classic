//
//  DataService.swift
//  PokeDex Classic
//
//  Created by Diego Rodriguez on 4/9/24.
//
import Foundation

class DataService {
    private let baseURL = "https://pokeapi.co/api/v2/"

    // Fetchs Pokemon by Name or ID
    func fetchPokemonDetails(for nameOrId: String, completion: @escaping (Result<Pokemon, Error>) -> Void) {
        let urlString = "\(baseURL)pokemon/\(nameOrId.lowercased())"
        performRequest(urlString: urlString, completion: completion)
    }

    //Gets a general list of Pokemon
    func fetchAllPokemon(completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        let urlString = "\(baseURL)pokemon?limit=151" // We only need first gen Pokemon
        performRequest(urlString: urlString) { [weak self] (result: Result<PokemonListResponse, Error>) in
            switch result {
            case .success(let listResponse):
                self?.fetchDetailsForPokemonList(listResponse.results, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    //For every Pokemon on the list, we need to fetch details like pic/stripe, abilities, stats...
    private func fetchDetailsForPokemonList(_ pokemonList: [PokemonPartial], completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        var pokemonDetails: [Pokemon] = []
        var errors: [Error] = []
        let group = DispatchGroup()

        for pokemon in pokemonList {
            group.enter()
            fetchPokemonDetails(for: pokemon.name) { result in
                defer { group.leave() }
                switch result {
                case .success(let details):
                    pokemonDetails.append(details)
                case .failure(let error):
                    errors.append(error)
                }
            }
        }

        group.notify(queue: .main) {
            if errors.isEmpty {
                completion(.success(pokemonDetails.sorted { $0.id < $1.id }))
            } else {
                completion(.failure(errors.first!))
            }
        }
    }

    // Performs an API request
    private func performRequest<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(DataError.invalidUrl))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(DataError.noData))
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    enum DataError: Error {
        case invalidUrl
        case noData
        case decodingError
    }
}
