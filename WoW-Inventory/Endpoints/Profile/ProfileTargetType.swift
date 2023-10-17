//
//  ProfileTargetType.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 17/10/2023.
//

import Moya

protocol ProfileTargetType: WITargetType {
    var profileBaseURL: String { get }
}

extension ProfileTargetType {
    
    var profileBaseURL: String {
        return "\(blizzardURL)/data/wow/"
    }

    // MARK: - WITargetType

    var parameters: [String: Any] {
        return [
            "namespace": "profile-eu",
            "locale": Locale.current.identifier
        ]
    }

}
