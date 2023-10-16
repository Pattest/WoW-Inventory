//
//  WoWGameData.swift
//  Sport_RxSwift
//
//  Created by Baptiste Cadoux on 24/06/2019.
//  Copyright © 2019 Interactive Mobility. All rights reserved.
//

import Moya

enum WoWGameData {
    case mount(id: String)
    case creatureDisplay(id: String)
}

extension WoWGameData: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://eu.api.blizzard.com/data/wow")!
    }
    
    var path: String {
        switch self {
        case .mount(let id):
            return "/mount/\(id)"
        case .creatureDisplay(let id):
            return "/media/creature-display/\(id)"
        }
    }
    
    var method: Method {
        switch self {
        case .mount,
                .creatureDisplay:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .mount,
                .creatureDisplay:
            return .requestParameters(
                parameters: [
                    "locale": Locale.current.identifier,
                    "namespace": "static-eu"
                ],
                encoding: URLEncoding.queryString)
            
        }
    }
    
    var sampleData: Data {
        switch self {
        case .mount, 
                .creatureDisplay:
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
