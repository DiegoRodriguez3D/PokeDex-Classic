//
//  PokeDex_ClassicApp.swift
//  PokeDex Classic
//
//  Created by Diego Rodriguez on 4/9/24.
//

import SwiftUI

@main
struct PokeDex_ClassicApp: App {
    @State var viewModel = PokemonViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
