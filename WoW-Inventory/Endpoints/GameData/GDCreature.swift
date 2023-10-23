//
//  GDCreature.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 17/10/2023.
//

import Moya

enum GDCreature {
    case creature(id: Int)
    case creatureDisplayMedia(id: Int)
    case creatureFamilyMedia(id: Int)
}

extension GDCreature: GameDataTargetType {
    
    var baseURL: URL {
        return URL(string: strBaseURL)!
    }
    
    var path: String {
        switch self {
        case .creature(let id):
            return "creature/\(id)"
        case .creatureDisplayMedia(let id):
            return "media/creature-display/\(id)"
        case .creatureFamilyMedia(let id):
            return "media/creature-family/\(id)"
        }
    }
    
    var method: Method {
        switch self {
        case .creature,
                .creatureDisplayMedia,
                .creatureFamilyMedia:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .creature,
                .creatureDisplayMedia,
                .creatureFamilyMedia:
            return .requestParameters(
                parameters: parameters,
                encoding: URLEncoding.default
            )
        }
    }
}
