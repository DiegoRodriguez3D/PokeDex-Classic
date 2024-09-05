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
    
    @State private var isSearchBarVisible = false
    @State private var searchText = ""
    @State private var isActive = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    if isSearchBarVisible {
                        SearchBar(searchText: $searchText, onSearch: {
                            viewModel.loadPokemon(by: searchText)
                        })
                    }
                    
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
                                    ForEach(viewModel.pokemons) { pokemon in
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
                .navigationTitle("PokéDex")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            withAnimation {
                                isSearchBarVisible.toggle()
                            }
                        }) {
                            Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                                .foregroundStyle(.black)
                        }
                    }
                }
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
