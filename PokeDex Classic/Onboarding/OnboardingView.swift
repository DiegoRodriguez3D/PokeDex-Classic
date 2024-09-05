//
//  OnboardingView.swift
//  PokeDex Classic
//
//  Created by Diego Rodriguez on 5/9/24.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var selectedViewIndex = 0
    
    var body: some View {
        
        ZStack {
            
            if selectedViewIndex == 0 {
                Color(red: 111/255, green: 154/255, blue: 189/255)
            }
            else {
                Color(red: 139/255, green: 166/255, blue: 65/255)
            }
            
            TabView (selection: $selectedViewIndex) {
                
                OnboardingViewDetails(bgColor: PokemonTypeColorHelper.color(forType: "fire"),
                                      headline: "Fetching them all!",
                                      subHeadline: "Pokédex Classic shows you all you need to know from the first 151 Pokémon.", buttonTex: "Continue") {
                    withAnimation {
                        selectedViewIndex = 1
                    }
                }
                                      .tag(0)
                                      .ignoresSafeArea()
                
                
                OnboardingViewDetails(bgColor: PokemonTypeColorHelper.color(forType: "water"),
                                      headline: "Dive into the Past!",
                                      subHeadline: "Splash into your childhood with every first gen Pokémon.", buttonTex: "Let's Go!") {
                    dismiss()
                }
                                      .tag(1)
                                      .ignoresSafeArea()
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            VStack {
                Spacer()
                HStack (spacing: 16) {
                    Spacer()
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 0 ? .white : .gray)
                    
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 1 ? .white : .gray)
                    Spacer()
                }
                .padding(.bottom, 220)
            }
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
