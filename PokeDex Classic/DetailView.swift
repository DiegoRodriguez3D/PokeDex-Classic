//
//  DetailView.swift
//  PokeDex Classic
//
//  Created by Diego Rodriguez on 4/9/24.
//
import SwiftUI

struct DetailView: View {
    @Environment(PokemonViewModel.self) var viewModel
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
                    headerSection
                        .padding(.top, 80)
                    Spacer()
                    
                    ZStack(alignment: .top) {
                        TabView(selection: $selectedTab) {
                            aboutSection.tag(0)
                            baseStatsSection.tag(1)
                            breedingSection.tag(2)
                            typeDefensesSection.tag(3)
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        .frame(height: geo.size.height/2)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                        
                        AsyncImage(url: URL(string: viewModel.selectedPokemon?.sprites.frontDefault ?? "")) { image in
                            image
                                .resizable()
                                .frame(width: geo.size.width, height: geo.size.width)
                                .offset(y: -(geo.size.height/3))
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
                .padding(.top)
            }
        }
        .ignoresSafeArea()
    }
    
    var headerSection: some View {
        
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
    }

    var aboutSection: some View {
        VStack(alignment: .leading) {
            Text("About")
                .font(.headline)
            Text("Height: \(viewModel.selectedPokemon?.height ?? 0) cm")
            Text("Weight: \(viewModel.selectedPokemon?.weight ?? 0) kg")
            Text("Abilities: \(viewModel.selectedPokemon?.abilities.map { $0.ability.name }.joined(separator: ", ") ?? "N/A")")
        }
    }

    var baseStatsSection: some View {
        VStack(alignment: .leading) {
            Text("Base Stats")
                .font(.headline)
            ForEach(viewModel.selectedPokemon?.stats ?? [], id: \.stat.url) { stat in
                HStack {
                    Text(stat.stat.name.capitalized)
                    Spacer()
                    Text("\(stat.baseStat)")
                }
            }
        }
    }

    var breedingSection: some View {
        VStack(alignment: .leading) {
            Text("Breeding")
                .font(.headline)
            // Placeholder for breeding data
            Text("Breeding data goes here")
        }
    }

    var typeDefensesSection: some View {
        VStack(alignment: .leading) {
            Text("Type Defenses")
                .font(.headline)
            // Placeholder for type defenses
            Text("Type defenses go here")
        }
    }
}

#Preview {
    DetailView()
        .environment(PokemonViewModel())
}
