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
    // Function to load all pokemons
       func loadPokemons() {
           Task {
               pokemons = try await dataService.fetchAllPokemon()
           }
       }

       // Function to load selected pokemon by name or id
       func loadPokemon(by nameOrId: String) {
           Task {
               selectedPokemon = try await dataService.fetchPokemonDetails(for: nameOrId)
           }
       }
}
