//
//  PokemonTypeColorHelper.swift
//  PokeDex Classic
//
//  Created by Diego Rodriguez on 4/9/24.
//

import Foundation
import SwiftUI

struct PokemonTypeColorHelper {
    static func color(forType type: String) -> Color {
        switch type.lowercased() {
        case "grass", "bug": return Color.green
        case "fire": return Color.red
        case "water", "ice": return Color.blue
        case "electric": return Color.yellow
        case "poison", "psychic": return Color.purple
        case "ground", "rock": return Color.brown
        case "dark": return Color.black
        case "ghost", "dragon": return Color.indigo
        case "fairy": return Color.pink
        case "normal": return Color.gray
        case "fighting": return Color.orange
        case "steel": return Color.gray.opacity(0.5)
        case "flying": return Color.skyBlue
        default: return Color.gray
        }
    }

  
}

extension Color {
    static let skyBlue = Color(red: 135/255, green: 206/255, blue: 235/255)
}
