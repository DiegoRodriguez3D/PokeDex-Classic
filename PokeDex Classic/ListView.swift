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

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.pokemons) { pokemon in
                        NavigationLink(destination: DetailView()) {
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(pokemon.types.isEmpty ? Color.gray : PokemonTypeColorHelper.color(forType: pokemon.types[0].type.name))
                                        .frame(height: 150)

                                    VStack(alignment: .leading) {
                                        Text(pokemon.name.capitalized)
                                            .font(.headline)
                                            .bold()
                                            .foregroundColor(.white)
                                            .shadow(radius: 2)

                                        VStack(alignment: .leading) {
                                            ForEach(pokemon.types) { type in
                                                Text(type.type.name.capitalized)
                                                    .foregroundColor(.white)
                                                    .font(.footnote)
                                                    .padding(8)
                                                    .frame(width: 60)
                                                    .background(Color(.white).opacity(0.3))
                                                    .cornerRadius(10)
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding()

                                    HStack(alignment: .bottom) {
                                        Spacer()
                                        
                                        VStack() {
                                            Spacer()
                                            
                                            ZStack(alignment: .bottom) {
                                                
                                                Image("pokeball")
                                                    .resizable()
                                                    .frame(width: 100, height: 100)
                                                    .offset(CGSize(width: 10, height: 10))
                                                    .opacity(0.3)
                                                
                                                AsyncImage(url: URL(string: pokemon.sprites.frontDefault ?? "")) { image in
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        
                                                    
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                                .frame(width: 120, height: 120)
                                                .shadow(radius: 5)
                                            }
                                        }
                                    }
                                }

                        }
                        .simultaneousGesture(TapGesture().onEnded {  
                                                    viewModel.selectedPokemon = pokemon
                                                })
                    }

                
                }
                .padding(.horizontal, 10)
            }
            .navigationTitle("PokeDex")
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            .onAppear {
                viewModel.loadPokemons()
            }
        }
    }
}

#Preview {
    ListView()
        .environment(PokemonViewModel())
}
