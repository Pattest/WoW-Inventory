//
//  Warcraft.swift
//  Sport_RxSwift
//
//  Created by Baptiste Cadoux on 20/06/2019.
//  Copyright © 2019 Interactive Mobility. All rights reserved.
//

import Moya

enum WoWCommunity {
    case mounts
}

extension WoWCommunity: TargetType {

    var baseURL: URL {
        return URL(string: "https://eu.api.blizzard.com/")!
    }
    
    var path: String {
        switch self {
        case .mounts:
            return "profile/user/wow/collections/mounts"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .mounts:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .mounts:
            return .requestParameters(
                parameters: [
                    "region": "eu",
                    "namespace": "profile-eu",
                    "locale": "fr_FR"
                ],
                encoding: URLEncoding.default)
        }
    }
    
    var sampleData: Data {
        switch self {
        case .mounts:
            return "".utf8Encoded
        }
    }

    var headers: [String: String]? {
        return [
            "Content-type": "application/json",
            "Authorization": "Bearer \(BlizzardCredentials.shared.getAccessToken())"
        ]
    }
}

// MARK: - Helpers

private extension String {
    
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
