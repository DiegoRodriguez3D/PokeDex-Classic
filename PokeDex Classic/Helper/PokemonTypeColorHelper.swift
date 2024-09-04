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
        case "grass":
            return Color(hue: 110/360, saturation: 0.5, brightness: 0.65)  // Natural green
        case "bug":
            return Color(hue: 80/360, saturation: 0.4, brightness: 0.6)    // Earthy green
        case "fire":
            return Color(hue: 10/360, saturation: 0.6, brightness: 0.65)   // Warm orange-red
        case "water":
            return Color(hue: 210/360, saturation: 0.5, brightness: 0.65)  // Soft ocean blue
        case "ice":
            return Color(hue: 190/360, saturation: 0.3, brightness: 0.75)  // Icy light blue
        case "electric":
            return Color(hue: 55/360, saturation: 0.7, brightness: 0.75)   // Vibrant yellow
        case "poison":
            return Color(hue: 290/360, saturation: 0.5, brightness: 0.6)   // Muted purple
        case "psychic":
            return Color(hue: 320/360, saturation: 0.6, brightness: 0.7)   // Bright pinkish purple
        case "ground":
            return Color(hue: 30/360, saturation: 0.4, brightness: 0.55)   // Warm brown
        case "rock":
            return Color(hue: 25/360, saturation: 0.5, brightness: 0.5)    // Strong earthy brown
        case "dark":
            return Color(hue: 0/360, saturation: 0.0, brightness: 0.35)    // Deep dark gray
        case "ghost":
            return Color(hue: 260/360, saturation: 0.5, brightness: 0.6)   // Mystical violet
        case "dragon":
            return Color(hue: 250/360, saturation: 0.6, brightness: 0.55)  // Royal deep purple
        case "fairy":
            return Color(hue: 330/360, saturation: 0.4, brightness: 0.75)  // Soft pink
        case "normal":
            return Color(hue: 0/360, saturation: 0.1, brightness: 0.7)     // Neutral light gray
        case "fighting":
            return Color(hue: 15/360, saturation: 0.6, brightness: 0.6)    // Reddish brown
        case "steel":
            return Color(hue: 210/360, saturation: 0.2, brightness: 0.55)  // Cool metallic gray-blue
        case "flying":
            return Color(hue: 200/360, saturation: 0.4, brightness: 0.7)   // Sky blue
        default:
            return Color(hue: 0/360, saturation: 0.0, brightness: 0.7)     // Default gray
        }
    }
    
    static func colorForStat(_ stat: String) -> Color {
        switch stat.lowercased() {
        case "hp":
            return Color(hue: 0/360, saturation: 0.6, brightness: 0.7)      // Strong red
        case "attack":
            return Color(hue: 30/360, saturation: 0.6, brightness: 0.7)     // Warm orange
        case "defense":
            return Color(hue: 210/360, saturation: 0.5, brightness: 0.65)   // Deep blue
        case "special-attack", "sp. atk":
            return Color(hue: 275/360, saturation: 0.5, brightness: 0.65)   // Intense purple
        case "special-defense", "sp. def":
            return Color(hue: 120/360, saturation: 0.5, brightness: 0.65)   // Calm green
        case "speed":
            return Color(hue: 340/360, saturation: 0.5, brightness: 0.7)    // Vibrant pink
        default:
            return Color(hue: 0/360, saturation: 0.0, brightness: 0.6)      // Moderate gray
        }
    }
}
