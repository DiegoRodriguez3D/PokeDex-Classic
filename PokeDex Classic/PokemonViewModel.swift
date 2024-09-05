//
//  PokemonModel.swift
//  PokeDex Classic
//
//  Created by Diego Rodriguez on 4/9/24.
//

import Foundation
import SwiftUI
import Combine

@Observable
class PokemonViewModel {
    var pokemons: [Pokemon] = []
    var selectedPokemon: Pokemon?
    
    var searchText: String = ""
    
    private var dataService = DataService()

    private var cancellables = Set<AnyCancellable>()

    init() {
        loadPokemons()
    }

    func loadPokemons() {
           dataService.fetchAllPokemon { result in
               DispatchQueue.main.async {
                   switch result {
                   case .success(let pokemons):
                       self.pokemons = pokemons
                   case .failure(let error):
                       print("Error fetching Pokémon: \(error)")
                   }
               }
           }
       }

    func loadPokemon(by nameOrId: String) {
        dataService.fetchPokemonDetails(for: nameOrId) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let pokemon):
                    self.selectedPokemon = pokemon
                case .failure(let error):
                    self.handleSearchError(error)
                }
            }
        }
    }

    private func handleSearchError(_ error: Error) {
        // Aquí puedes definir cómo manejar errores, por ejemplo:
        if let urlError = error as? URLError, urlError.code == .fileDoesNotExist {
            print("No se han encontrado resultados para el Pokémon especificado.")
        } else {
            print("Error al cargar detalles del Pokémon: \(error)")
        }
    }
}
