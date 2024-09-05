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
    @AppStorage("onboarding") var needsOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environment(viewModel)
                .fullScreenCover(isPresented: $needsOnboarding) {
                    // on dismiss
                    needsOnboarding = false
                } content: {
                    OnboardingView()
                }
        }
    }
}
