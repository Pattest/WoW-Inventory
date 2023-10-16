//
//  BlizzardCredentials.swift
//  World_of_Warcraft
//
//  Created by Baptiste Cadoux on 20/06/2019.
//  Copyright © 2019 Interactive Mobility. All rights reserved.
//

import Foundation

public class BlizzardCredentials {

    static var shared = BlizzardCredentials()
    
    static let credentialsPlist: [String: String] = {
        if let credentialsPlistPath = Bundle.main.url(forResource: "BlizzardCredentials",
                                                      withExtension: "plist") {
            let credentialsPlistData = try! Data(contentsOf: credentialsPlistPath)
            
            let dict = try! PropertyListSerialization.propertyList(
                from: credentialsPlistData,
                options: [],
                format: nil) as! [String: String]
            return dict
        }
        return [:]
    }()

    let clientID: String = credentialsPlist["client_id"]!
    let clientSecret: String = credentialsPlist["client_secret"]!
    let redirectUri: String = credentialsPlist["redirect_uri"]!

    private var accessToken: String = ""

    //

    func getBase64LoginString() -> String {
        let loginString = "\(clientID):\(clientSecret)"
        let loginData = loginString.data(using: .utf8)!
        return loginData.base64EncodedString()
    }

    // MARK: - Access token

    func getAccessToken() -> String {
        let defaults = UserDefaults.standard
        let decoder = JSONDecoder()
        guard let tokenData = defaults.data(forKey: UDKey.accessToken.rawValue),
              let decodedToken = try? decoder.decode(String.self, from: tokenData) else {
            return ""
        }
        return decodedToken
    }

    func setAccessToken(_ accessToken: String) {
        let defaults = UserDefaults.standard
        let encoder = JSONEncoder()
        if let encodedToken = try? encoder.encode(accessToken) {
            defaults.setValue(encodedToken, forKey: UDKey.accessToken.rawValue)
        }
    }
}
