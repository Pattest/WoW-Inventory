//
//  WITargetType.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 17/10/2023.
//

import Moya

protocol WITargetType: TargetType {
    var strBaseURL: String { get }
    var parameters: [String: Any] { get }
}

extension WITargetType {

    // MARK: - TargetType

    var headers: [String: String]? {
        return [
            "Content-type": "application/json",
            "Authorization": "Bearer \(BlizzardCredentials.shared.loadAccessToken())"
        ]
    }
}
