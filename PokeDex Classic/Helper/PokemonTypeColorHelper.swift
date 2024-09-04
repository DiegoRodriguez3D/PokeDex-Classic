//
//  PokemonTypeColorHelper.swift
//  PokeDex Classic
//
//  Created by Diego Rodriguez on 4/9/24.
//

import SwiftUI

struct PokemonTypeColorHelper {
    static func color(forType type: String) -> Color {
        switch type.lowercased() {
        case "grass", "bug":
            return Color(hue: 120/360, saturation: 0.3, brightness: 0.7)
        case "fire":
            return Color(hue: 0/360, saturation: 0.4, brightness: 0.7)
        case "water", "ice":
            return Color(hue: 240/360, saturation: 0.3, brightness: 0.7)
        case "electric":
            return Color(hue: 60/360, saturation: 0.4, brightness: 0.7)
        case "poison", "psychic":
            return Color(hue: 300/360, saturation: 0.3, brightness: 0.7)
        case "ground", "rock":
            return Color(hue: 30/360, saturation: 0.3, brightness: 0.7)
        case "dark":
            return Color(hue: 0/360, saturation: 0.0, brightness: 0.5)  // Very muted
        case "ghost", "dragon":
            return Color(hue: 270/360, saturation: 0.3, brightness: 0.7)
        case "fairy":
            return Color(hue: 330/360, saturation: 0.3, brightness: 0.7)
        case "normal":
            return Color(hue: 0/360, saturation: 0.0, brightness: 0.7)
        case "fighting":
            return Color(hue: 15/360, saturation: 0.3, brightness: 0.7)
        case "steel":
            return Color(hue: 0/360, saturation: 0.0, brightness: 0.6)  // More muted
        case "flying":
            return Color(hue: 210/360, saturation: 0.4, brightness: 0.7)
        default:
            return Color(hue: 0/360, saturation: 0.0, brightness: 0.7)
        }
    }
}


