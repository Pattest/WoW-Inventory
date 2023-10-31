//
//  BlizzardOAuth.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 28/06/2019.
//  Copyright © 2019 Baptistecdx. All rights reserved.
//

import Moya

enum BlizzardOAuth {
    case authorize
    case token(code: String)
    case checkToken(token: String)
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

        case .checkToken:
            return "check_token"
        }
    }

    var method: Method {
        switch self {
        case .authorize:
            return .get

        case .token,
                .checkToken:
            return .post
        }
    }

    var task: Task {
        switch self {
        case .authorize:
            return .requestParameters(
                parameters: [
                    "response_type": "code",
                    "client_id": WICredentials.shared.clientID,
                    "redirect_uri": WICredentials.shared.redirectUri,
                    "scope": "wow.profile"
                ],
                encoding: JSONEncoding.default)

        case .token(let code):
            return .requestParameters(
                parameters: [
                    "grant_type": "authorization_code",
                    "code": code,
                    "redirect_uri": WICredentials.shared.redirectUri
                ],
                encoding: URLEncoding.httpBody)

        case .checkToken(let token):
            return .requestParameters(
                parameters: [
                    "token": token
                ],
                encoding: URLEncoding.httpBody)
        }
    }

    var headers: [String: String]? {
        switch self {
        case .authorize:
            return [
                "Content-type": "application/json"
            ]

        case .checkToken:
            return [
                "Content-type": "application/x-www-form-urlencoded"
            ]

        case .token:
            let base64LoginString = WICredentials.shared.getBase64LoginString()
            return [
                "Content-type": "application/x-www-form-urlencoded",
                "Authorization": "Basic \(base64LoginString)"
            ]
        }
    }
}
