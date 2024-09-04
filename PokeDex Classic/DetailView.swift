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
        ZStack {
            // Usa el color de fondo aquí y asegúrate de que llena toda la pantalla.
            Color(red: 111/255, green: 154/255, blue: 189/255)
                .edgesIgnoringSafeArea(.all)  // Asegura que el color se extienda a todas las áreas de la pantalla.

            VStack(spacing: 20) {
                headerSection
                typeTagsSection
                Spacer()
                TabView(selection: $selectedTab) {
                    aboutSection.tag(0)
                    baseStatsSection.tag(1)
                    breedingSection.tag(2)
                    typeDefensesSection.tag(3)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 300)  // Ajusta según las necesidades de tu contenido
                .background(Color.white)  // Asegúrate de que el fondo del TabView sea blanco
                .clipShape(RoundedRectangle(cornerRadius: 12))  // Redondea las esquinas del TabView
                .padding(.horizontal)  // Añade padding horizontal si es necesario
            }
            .padding(.top)  // Añade padding en la parte superior si es necesario para evitar la notch o el sensor.
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
