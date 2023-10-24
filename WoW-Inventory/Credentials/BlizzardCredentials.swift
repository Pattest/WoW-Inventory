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

public class BlizzardCredentials {

    static var shared = BlizzardCredentials()
    
    private static let credentialsPlist: [String: String] = {
        guard let credentialsPlistPath = Bundle.main.url(forResource: "BlizzardCredentials",
                                                      withExtension: "plist")
        else {
            return [:]
        }
    
        let credentialsPlistData = try! Data(contentsOf: credentialsPlistPath)
            
        let dict = try! PropertyListSerialization.propertyList(
            from: credentialsPlistData,
            options: [],
            format: nil) as! [String: String]
        return dict
    }()

    let clientID: String = credentialsPlist["client_id"]!
    let clientSecret: String = credentialsPlist["client_secret"]!
    let redirectUri: String = credentialsPlist["redirect_uri"]!
    let baseURL: String = credentialsPlist["base_url"]!

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
