//
//  ProfileTargetType.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 17/10/2023.
//

import Foundation

protocol ProfileTargetType: WITargetType {
    //
}

extension ProfileTargetType {

    var strBaseURL: String {
        return "\(WICredentials.shared.baseURL)/profile/wow"
    }

    // MARK: - WITargetType

    var parameters: [String: Any] {
        return [
            "namespace": "profile-eu",
            "locale": Locale.current.identifier
        ]
    }

}
