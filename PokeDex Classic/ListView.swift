//
//  ListView.swift
//  PokeDex Classic
//
//  Created by Diego Rodriguez on 4/9/24.
//
import SwiftUI
import Combine

struct ListView: View {
    @Environment(PokemonViewModel.self) var viewModel
    
    @State private var searchText = ""
    @State private var isActive = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        let glossaryItems = viewModel.pokemons
        
        var filteredItems: [Pokemon] {
            if searchText.isEmpty {
                return glossaryItems
            } else {
                return glossaryItems.filter { item in
                    item.name.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
        
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    ZStack (alignment: .topTrailing) {
                        Image("pokeball")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 300, height: 300)
                            .offset(x: 120,y: -115)
                            .colorInvert()
                            .opacity(0.05)
                        
                        ScrollView {
                            VStack(alignment: .leading) {
                                LazyVGrid(columns: columns, spacing: 20) {
                                    ForEach(filteredItems) { pokemon in
                                        NavigationLink(destination: DetailView()) {
                                            PokemonCard(pokemon: pokemon)
                                        }
                                        .simultaneousGesture(TapGesture().onEnded {
                                            viewModel.selectedPokemon = pokemon
                                        })
                                    }
                                }
                                .shadow(radius: 5)
                                .padding(.horizontal, 10)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .scrollIndicators(.hidden)
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Who you gonna call?")
                .navigationTitle("PokéDex")
                .onAppear {
                    viewModel.loadPokemons()
                }
                .navigationDestination(isPresented: $isActive, destination: {
                    DetailView()
                })
                .onChange(of: viewModel.selectedPokemon) { oldValue, newValue in
                    isActive = newValue != nil
                }
            }
        }
    }
}

#Preview {
    ListView()
        .environment(PokemonViewModel())
}
