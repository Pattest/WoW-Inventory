//
//  OAuthToken.swift
//  World_of_Warcraft
//
//  Created by Baptiste Cadoux on 12/10/2023.
//  Copyright © 2023 Baptistecdx. All rights reserved.
//

import Foundation

struct OAuthToken: Decodable {

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case scope
    }

    var accessToken: String
    var tokenType: String
    var expiresIn: Int
    var scope: String
}
