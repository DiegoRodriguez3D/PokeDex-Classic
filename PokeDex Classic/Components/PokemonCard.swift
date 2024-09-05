//
//  PokemonCard.swift
//  PokeDex Classic
//
//  Created by Diego Rodriguez on 5/9/24.
//

import SwiftUI

struct PokemonCard: View {
    var pokemon: Pokemon
    
    var body: some View {
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
                            .offset(CGSize(width: 11, height: 11))
                            .clipped()
                            .offset(CGSize(width: 10, height: 0))
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
}

#Preview {
    ListView()
        .environment(PokemonViewModel())
}
