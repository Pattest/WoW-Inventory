//
//  LoginViewModel.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 24/10/2023.
//

import Foundation

class LoginViewModel {

    private var service = LoginService()

    // MARK: - AccessToken

    func getAccessToken() -> String {
        let accessToken = WICredentials.shared.loadAccessToken()
        return accessToken
    }

    func setAccessToken(_ token: String) {
        WICredentials.shared.saveAccessToken(token)
    }
}

// MARK: - Service

extension LoginViewModel {

    func checkAccessToken(_ token: String, handler: @escaping (Bool) -> Void) {
        service.checkTokenAvailability(token, handler: handler)
    }

    func fetchAccessToken(_ authToken: String, handler: @escaping (Bool) -> Void) {
        service.fetchAccessToken(authToken, handler: handler)
    }
}
