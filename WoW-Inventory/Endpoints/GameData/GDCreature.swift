//
//  GDCreature.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 17/10/2023.
//

import Moya

enum GDCreature {
    case creature(id: String)
    case creatureDisplayMedia(id: String)
    case creatureFamilyMedia(id: String)
}

extension GDCreature: GameDataTargetType {
    
    var baseURL: URL {
        return URL(string: gameDataBaseURL)!
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
        var parameters = [
            "locale": Locale.current.identifier,
            "namespace": "static-eu"
        ]

        switch self {
        case .creature,
                .creatureDisplayMedia,
                .creatureFamilyMedia:
            return .requestParameters(
                parameters: parameters,
                encoding: URLEncoding.queryString)
        }
    }
}
