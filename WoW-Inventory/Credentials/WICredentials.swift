//
//  BlizzardCredentials.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 20/06/2019.
//  Copyright © 2019 Interactive Mobility. All rights reserved.
//

import Foundation

enum CredentialKey: String {
    case clientId
}

public class WICredentials {

    static var shared = WICredentials()

    private static let credentialsPlist: [String: String] = {
        guard let credentialsPlistPath = Bundle.main.url(forResource: "WICredentials",
                                                         withExtension: "plist"),
              let credentialsPlistData = try? Data(contentsOf: credentialsPlistPath),
              let dict = try? PropertyListSerialization.propertyList(
                from: credentialsPlistData,
                options: [],
                format: nil) as? [String: String]
        else {
            return [:]
        }

        return dict
    }()

    let appCenterSecret: String = credentialsPlist["APP_CENTER_SECRET"] ?? ""
    let clientID: String = credentialsPlist["CLIENT_ID"] ?? ""
    let clientSecret: String = credentialsPlist["CLIENT_SECRET"] ?? ""
    let redirectUri: String = credentialsPlist["REDIRECT_URI"] ?? ""

    let baseURL: String = {
        return Bundle.main.infoDictionary?["BASE_URL"] as? String ?? ""
    }()

    //

    func getBase64LoginString() -> String {
        let loginString = "\(clientID):\(clientSecret)"
        let loginData = loginString.data(using: .utf8)!
        return loginData.base64EncodedString()
    }

    // MARK: - Access token

    func loadAccessToken() -> String {
        let defaults = UserDefaults.standard
        let decoder = JSONDecoder()
        guard let tokenData = defaults.data(forKey: UDKey.accessToken.rawValue),
              let decodedToken = try? decoder.decode(String.self, from: tokenData) else {
            return ""
        }
        return decodedToken
    }

    func saveAccessToken(_ accessToken: String) {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        if let encodedToken = try? encoder.encode(accessToken) {
            defaults.setValue(encodedToken, forKey: UDKey.accessToken.rawValue)
        }
    }
}
