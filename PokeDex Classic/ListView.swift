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
            ZStack (alignment: .topTrailing) {
                Image("pokeball")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                    .offset(x: 150,y: -150)
                    .colorInvert()
                    .opacity(0.05)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("PokeDex")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                        
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(viewModel.pokemons) { pokemon in
                                NavigationLink(destination: DetailView()) {
                                    ZStack(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(pokemon.types.isEmpty ? Color.gray : PokemonTypeColorHelper.color(forType: pokemon.types[0].type.name))
                                            .frame(height: 150)
                                        
                                        VStack(alignment: .leading) {
                                            HStack {
                                                Text(pokemon.name.capitalized)
                                                    .font(.headline)
                                                    .bold()
                                                    .foregroundColor(.white)
                                                
                                                Spacer()
                                                
                                                Text("#\(pokemon.id)")
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                                    .bold()
                                                    .opacity(0.5)
                                            }
                                            
                                            VStack(alignment: .leading) {
                                                ForEach(pokemon.types) { type in
                                                    Text(type.type.name.capitalized)
                                                        .foregroundColor(.white)
                                                        .font(.footnote)
                                                        .padding(8)
                                                        .frame(width: 70)
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
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 100, height: 100)
                                                        .offset(CGSize(width: 10, height: 10))
                                                        .clipped()
                                                        .offset(CGSize(width: 9, height: 0))
                                                        .opacity(0.3)
                                                    
                                                    
                                                    AsyncImage(url: URL(string: pokemon.sprites.frontDefault ?? "")) { image in
                                                        image
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                        
                                                        
                                                    } placeholder: {
                                                        ProgressView()
                                                    }
                                                    .frame(width: 120, height: 120)
                                                    .shadow(radius: 8)
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
                        .shadow(radius: 5)
                        .padding(.horizontal, 10)
                    }
                }
            }
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
