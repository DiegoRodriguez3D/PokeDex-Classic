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
        VStack(spacing: 20) {
            VStack {
                headerSection
                typeTagsSection
            }
            .background(.red)
            
            TabView(selection: $selectedTab) {
                aboutSection.tag(0)
                baseStatsSection.tag(1)
                breedingSection.tag(2)
                typeDefensesSection.tag(3)
            }
            .background(.white)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))  // Ajuste para mostrar estilo de página sin indicadores
            .frame(height: 300)  // Asegúrate de dar un marco fijo al TabView
        }
        
        .padding()
        .navigationTitle(viewModel.selectedPokemon?.name.capitalized ?? "Pokémon")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("#\(viewModel.selectedPokemon?.id ?? 0)")
            }
        }
    }
    var headerSection: some View {
        VStack {
            AsyncImage(url: URL(string: viewModel.selectedPokemon?.sprites.frontDefault ?? "")) { image in
                image
                    .resizable()
                    .frame(width: 200, height: 200)
            } placeholder: {
                Color.gray.frame(width: 200, height: 200)
            }
            .frame(width: 200, height: 200)
            .background(Color.white.opacity(0.5))
            .cornerRadius(100)
        }
    }

    var typeTagsSection: some View {
        HStack {
            ForEach(viewModel.selectedPokemon?.types ?? [], id: \.slot) { type in
                Text(type.type.name.uppercased())
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(PokemonTypeColorHelper.color(forType: type.type.name))
                    .cornerRadius(5)
                    .foregroundColor(.white)
                    .font(.caption)
            }
        }
    }

    var aboutSection: some View {
        VStack(alignment: .leading) {
            Text("About")
                .font(.headline)
            Text("Height: \(viewModel.selectedPokemon?.height ?? 0) cm")
            Text("Weight: \(viewModel.selectedPokemon?.weight ?? 0) kg")
            Text("Abilities: \(viewModel.selectedPokemon?.abilities.map { $0.ability.name }.joined(separator: ", ") ?? "N/A")")
        }
        .padding()
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
        .padding()
    }

    var breedingSection: some View {
        VStack(alignment: .leading) {
            Text("Breeding")
                .font(.headline)
            // Placeholder for breeding data
            Text("Breeding data goes here")
        }
        .padding()
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
