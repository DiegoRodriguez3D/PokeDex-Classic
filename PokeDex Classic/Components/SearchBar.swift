//
//  SearchBar.swift
//  PokeDex Classic
//
//  Created by Diego Rodriguez on 5/9/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    var onSearch: () -> Void

    var body: some View {
        VStack {
            HStack {
                TextField("Enter Pokémon Name or ID", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .frame(height: 44)
                    .padding(.leading, 10)
                
                Button(action: onSearch) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15)
                        .padding(10)
                }
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
            }
            .padding(.horizontal, 20)
        }
        .padding(.top, 8)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
