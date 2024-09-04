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
        setupSearch()
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

    func setupSearch() {
//        $searchText
//            .removeDuplicates()
//            .debounce(for: 0.5, scheduler: RunLoop.main)
//            .sink { [weak self] in self?.filterPokemons(with: $0) }
//            .store(in: &cancellables)
    }

    private func filterPokemons(with filter: String) {
        if filter.isEmpty {
            loadPokemons()
        } else {
            pokemons = pokemons.filter { $0.name.lowercased().contains(filter.lowercased()) }
        }
    }
}
