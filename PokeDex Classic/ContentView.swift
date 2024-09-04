//
//  ContentView.swift
//  PokeDex Classic
//
//  Created by Diego Rodriguez on 4/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(PokemonViewModel.self) var viewModel
    
    var body: some View {
        
        VStack {
            ListView()
                .environment(viewModel)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
