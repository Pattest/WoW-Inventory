//
//  GameDataTargetType.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 17/10/2023.
//

import Moya

protocol GameDataTargetType: WITargetType {
    var gameDataBaseURL: String { get }
}

extension GameDataTargetType {

    var gameDataBaseURL: String {
        return "\(blizzardURL)/data/wow/"
    }

    // MARK: - WITargetType

    var parameters: [String: Any] {
        return [
            "namespace": "static-eu",
            "locale": Locale.current.identifier
        ]
    }

}
