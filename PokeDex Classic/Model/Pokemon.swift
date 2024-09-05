//
//  Pokemon.swift
//  PokeDex Classic
//
//  Created by Diego Rodriguez on 4/9/24.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    let id: Int
    let name: String
    let baseExperience: Int
    let height: Int
    let weight: Int
    let isDefault: Bool
    let sprites: PokemonSprites
    let abilities: [PokemonAbility]
    let stats: [PokemonStat]
    let types: [PokemonType]
    let moves: [PokemonMove]

    enum CodingKeys: String, CodingKey {
        case id, name, height, weight, abilities, stats, types, moves, sprites
        case baseExperience = "base_experience"
        case isDefault = "is_default"
    }
}

struct PokemonSprites: Codable {
    let frontDefault: String?
    let frontShiny: String?
    let frontFemale: String?
    let frontShinyFemale: String?
    let backDefault: String?
    let backShiny: String?
    let backFemale: String?
    let backShinyFemale: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case frontFemale = "front_female"
        case frontShinyFemale = "front_shiny_female"
        case backDefault = "back_default"
        case backShiny = "back_shiny"
        case backFemale = "back_female"
        case backShinyFemale = "back_shiny_female"
    }
}

struct PokemonAbility: Codable {
    let isHidden: Bool
    let slot: Int
    let ability: NamedAPIResource

    enum CodingKeys: String, CodingKey {
        case slot
        case ability
        case isHidden = "is_hidden"
    }
}

struct PokemonStat: Codable {
    let baseStat: Int
    let effort: Int
    let stat: NamedAPIResource

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}

struct PokemonType: Codable, Identifiable {
    let slot: Int
    let type: NamedAPIResource
    
    var id: String { type.name }
}

struct NamedAPIResource: Codable {
    let name: String
    let url: String
}

struct PokemonMove: Codable {
    let move: NamedAPIResource
    let versionGroupDetails: [PokemonMoveVersion]

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}

struct PokemonMoveVersion: Codable {
    let levelLearnedAt: Int
    let moveLearnMethod: NamedAPIResource
    let versionGroup: NamedAPIResource

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}

struct PokemonListResponse: Codable {
    let results: [PokemonPartial]
}

struct PokemonPartial: Codable {
    let name: String
    let url: String
}

