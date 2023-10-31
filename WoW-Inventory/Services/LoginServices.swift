//
//  LoginServices.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 24/10/2023.
//

import Moya

class LoginServices {

    private let provider = MoyaProvider<BlizzardOAuth>()

    func checkTokenAvailability(_ token: String, handler: @escaping (Bool) -> Void) {
        provider.request(.checkToken(token: token)) { result in
            switch result {
            case .success(let moyaResponse):
                if WIError.decodeError(from: moyaResponse.data) != nil {
                    handler(false)
                } else {
                    handler(true)
                }

            case .failure:
                handler(false)
            }
        }
    }

    func fetchAccessToken(_ authToken: String, handler: @escaping (Bool) -> Void) {
        provider.request(.token(code: authToken)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let data = moyaResponse.data
                    let decoder = JSONDecoder()
                    let oauthToken = try decoder.decode(OAuthToken.self, from: data)
                    WICredentials.shared.saveAccessToken(oauthToken.accessToken)
                    handler(true)

                } catch {
                    print("BlizzardOAuth.token : \(error.localizedDescription)")
                    handler(false)
                }

            case let .failure(error):
                print("BlizzardOAuth.token failure: \(error.localizedDescription)")
                handler(false)
            }
        }
    }
}
