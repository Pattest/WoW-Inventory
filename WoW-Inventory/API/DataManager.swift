//
//  DataManager.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 12/10/2023.
//  Copyright © 2023 Baptistecdx. All rights reserved.
//

import Foundation
import Moya

class DataManager {
    
    static var shared = DataManager()

    func getAccessToken(code: String, handler: @escaping (Bool) -> Void) {
        let provider = MoyaProvider<BlizzardOAuth>()
        provider.request(.token(code: code)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let data = moyaResponse.data
                    let decoder = JSONDecoder()
                    let oauthToken = try decoder.decode(OAuthToken.self, from: data)
                    BlizzardCredentials.shared.setAccessToken(oauthToken.accessToken)
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
