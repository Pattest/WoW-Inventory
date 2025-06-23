//
//  GameDataTargetType.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 17/10/2023.
//

import Foundation

protocol GameDataTargetType: WITargetType {
    var namespace: String { get }
}

extension GameDataTargetType {

    var strBaseURL: String {
        return "\(WICredentials.shared.baseURL)/data/wow"
    }

    // MARK: - WITargetType

    var parameters: [String: Any] {
        return [
            "namespace": namespace,
            "locale": Locale.current.identifier
        ]
    }

}
