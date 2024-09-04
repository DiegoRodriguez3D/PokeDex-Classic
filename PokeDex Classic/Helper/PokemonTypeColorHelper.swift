//
//  PokemonTypeColorHelper.swift
//  PokeDex Classic
//
//  Created by Diego Rodriguez on 4/9/24.
//

import SwiftUI

struct PokemonTypeColorHelper {
    static func color(forType type: String) -> Color {
        let pastelOpacity: Double = 0.6  // Nivel de transparencia para suavizar los colores
        switch type.lowercased() {
        case "grass", "bug":
            return Color.green.opacity(pastelOpacity)
        case "fire":
            return Color.red.opacity(pastelOpacity)
        case "water", "ice":
            return Color.blue.opacity(pastelOpacity)
        case "electric":
            return Color.yellow.opacity(pastelOpacity)
        case "poison", "psychic":
            return Color.purple.opacity(pastelOpacity)
        case "ground", "rock":
            return Color.brown.opacity(pastelOpacity)
        case "dark":
            return Color.black.opacity(pastelOpacity)
        case "ghost", "dragon":
            return Color.indigo.opacity(pastelOpacity)
        case "fairy":
            return Color.pink.opacity(pastelOpacity)
        case "normal":
            return Color.gray.opacity(pastelOpacity)
        case "fighting":
            return Color.orange.opacity(pastelOpacity)
        case "steel":
            return Color.gray.opacity(0.4)  // Más sutileza para un tipo metálico
        case "flying":
            return Color.skyBlue.opacity(pastelOpacity)
        default:
            return Color.gray.opacity(pastelOpacity)
        }
    }
}

extension Color {
    static let skyBlue = Color(red: 135/255, green: 206/255, blue: 235/255).opacity(0.6)
}

