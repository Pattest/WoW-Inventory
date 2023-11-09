//
//  LoginService.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 24/10/2023.
//

import Foundation

protocol LoginServiceProtocol: AnyObject {
    func checkTokenAvailability(_ token: String, handler: @escaping (Bool) -> Void)
    func fetchAccessToken(_ authToken: String, handler: @escaping (Bool) -> Void)
}

class LoginService: LoginServiceProtocol {

    func checkTokenAvailability(_ token: String, handler: @escaping (Bool) -> Void) {
        DataLoader.shared.checkTokenAvailability(token) { response in
            guard let response else { return handler(false) }

            if WIError.decodeError(from: response.data) != nil {
                handler(false)
            } else {
                handler(true)
            }
        }
    }

    func fetchAccessToken(_ authToken: String, handler: @escaping (Bool) -> Void) {
        DataLoader.shared.fetchAccessToken(authToken) { response in
            guard let response else { return handler(false) }

            do {
                let data = response.data
                let decoder = JSONDecoder()
                let oauthToken = try decoder.decode(OAuthToken.self, from: data)
                WICredentials.shared.saveAccessToken(oauthToken.accessToken)
                handler(true)

            } catch {
                print("LoginService > fetchAccessToken: \(error.localizedDescription)")
                handler(false)
            }
        }
    }
}
