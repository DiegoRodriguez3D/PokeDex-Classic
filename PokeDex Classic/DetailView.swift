//
//  DetailView.swift
//  PokeDex Classic
//
//  Created by Diego Rodriguez on 4/9/24.
//
import SwiftUI

struct DetailView: View {
    @Environment(PokemonViewModel.self) var viewModel
    @Environment(\.colorScheme) var colorScheme
    
    @State var selectedTab = 0
    
    var body: some View {
        let backgroundColor = viewModel.selectedPokemon.map {
            PokemonTypeColorHelper.color(forType: $0.types.first?.type.name ?? "")
        } ?? .red
        
        GeometryReader { geo in
            ZStack {
                ZStack(alignment: .trailing) {
                    ZStack(alignment: .topLeading) {
                        backgroundColor.edgesIgnoringSafeArea(.all)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.white)
                            .frame(width: 200, height: 200)
                            .opacity(0.15)
                            .offset(x: -50, y:-80)
                            .rotationEffect(.degrees(-20))
                    }
                    
                    ZStack(alignment: .top) {
                        Image("pokeball")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .opacity(0.3)
                            .offset(x: -(geo.size.width/50), y: -(geo.size.height/10))
                        
                        Image("dots")
                            .resizable()
                            .colorInvert()
                            .frame(width: 100, height: 100)
                            .opacity(0.1)
                            .offset(x: -(geo.size.width/2), y: -(geo.size.height/10))
                        
                    }
                }
                
                VStack(spacing: 20) {
                    HStack() {
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text(viewModel.selectedPokemon?.name.capitalized ?? "Pokemon")
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(.white)
                            
                            
                            HStack {
                                ForEach(viewModel.selectedPokemon?.types ?? [], id: \.slot) { type in
                                    Text(type.type.name.capitalized)
                                        .foregroundColor(.white)
                                        .font(.footnote)
                                        .padding(8)
                                        .frame(width: 70)
                                        .background(Color(.white).opacity(0.3))
                                        .cornerRadius(10)
                                }
                            }
                        }
                        
                        Spacer()
                        
                        Text("#\(viewModel.selectedPokemon?.id ?? 0)")
                            .font(.title3)
                            .bold()
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 80)
                    
                    Spacer()
                    
                    ZStack(alignment: .top) {
                        VStack {
                            VStack {
                                Picker("Sections", selection: $selectedTab) {
                                    Text("About").tag(0)
                                    Text("Base Stats").tag(1)
                                }
                                .pickerStyle(.segmented)
                                .padding(.horizontal, 30)
                                .padding(.top, 80)
                                
                                TabView(selection: $selectedTab) {
                                    //About Section
                                    VStack(alignment: .leading){
                                        AboutTextView(
                                            height: "\(viewModel.selectedPokemon?.formattedHeightInMeters ?? "0") m",
                                            weight: "\(viewModel.selectedPokemon?.formattedWeightInKilograms ?? "0") kg",
                                            abilities: "\(viewModel.selectedPokemon?.abilities.map { $0.ability.name.capitalized }.joined(separator: ", ") ?? "N/A")",
                                            baseExp: "\(viewModel.selectedPokemon?.baseExperience ?? 0) exp"
                                        )
                                    }
                                    .padding(.horizontal, 40)
                                    .tag(0)
                                    
                                    //Base Stats Section
                                    StatsView(stats: viewModel.selectedPokemon?.stats ?? [])
                                        .padding(.horizontal, 40)
                                        .tag(1)
                                    
                                }
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                                
                            }
                            .frame(height: geo.size.height/2)
                            .background(colorScheme == .dark ? Color.black : Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 32))
                        }
                        
                        AsyncImage(url: URL(string: viewModel.selectedPokemon?.sprites.frontDefault ?? "")) { image in
                            image
                                .resizable()
                                .frame(width: geo.size.width, height: geo.size.width)
                                .offset(y: -(geo.size.height/3))
                                .allowsHitTesting(false)
                        } placeholder: {
                            ProgressView()
                                .allowsHitTesting(false)
                        }
                    }
                }
                .padding(.top)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    DetailView()
        .environment(PokemonViewModel())
}
