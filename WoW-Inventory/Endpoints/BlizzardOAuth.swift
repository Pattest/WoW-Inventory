//
//  BlizzardOAuth.swift
//  World_of_Warcraft
//
//  Created by Baptiste Cadoux on 28/06/2019.
//  Copyright © 2019 Baptistecdx. All rights reserved.
//

import Moya

enum BlizzardOAuth {
    case authorize
    case token(code: String)
}

extension BlizzardOAuth: TargetType {

    var baseURL: URL {
        return URL(string: "https://oauth.battle.net/")!
    }
    
    var path: String {
        switch self {
        case .authorize:
            return "authorize"

        case .token:
            return "token"
        }
    }
    
    var method: Method {
        switch self {
        case .authorize:
            return .get

        case .token:
            return .post
        }
    }
    
    var sampleData: Data {
        return "".utf8Encoded
    }
    
    var task: Task {
        switch self {
        case .authorize:
            return .requestParameters(
                parameters: [
                    "region": "eu",
                    "response_type": "code",
                    "client_id": BlizzardCredentials.shared.clientID,
                    "redirect_uri": BlizzardCredentials.shared.redirectUri,
                    "scope": "wow.profile"
                ],
                encoding: URLEncoding.queryString)

        case .token(let code):
            return .requestParameters(
                parameters: [
                    "grant_type": "authorization_code",
                    "code": code,
                    "redirect_uri": BlizzardCredentials.shared.redirectUri
                ],
                encoding: URLEncoding.httpBody)
        }
    }

    var headers: [String: String]? {
        switch self {
        case .authorize:
            return [
                "Content-type": "application/json",
            ]

        case .token:
            let base64LoginString = BlizzardCredentials.shared.getBase64LoginString()
            return [
                "Content-type": "application/x-www-form-urlencoded",
                "Authorization": "Basic \(base64LoginString)"
            ]
        }
        
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
