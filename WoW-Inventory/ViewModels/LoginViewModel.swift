//
//  LoginViewModel.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 24/10/2023.
//

import Foundation

class LoginViewModel {

    private var services = LoginServices()
    
    // MARK: - AccessToken

    func getAccessToken() -> String {
        let accessToken = BlizzardCredentials.shared.loadAccessToken()
        return accessToken
    }

    func setAccessToken(_ token: String) {
        BlizzardCredentials.shared.saveAccessToken(token)
    }
}

// MARK: - Services

extension LoginViewModel {

    func checkAccessToken(_ token: String, handler: @escaping (Bool) -> Void) {
        services.checkTokenAvailability(token, handler: handler)
    }

    func fetchAccessToken(_ authToken: String, handler: @escaping (Bool) -> Void) {
        services.fetchAccessToken(authToken, handler: handler)
    }
}
