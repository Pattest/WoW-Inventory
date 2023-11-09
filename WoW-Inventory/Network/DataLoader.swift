//
//  DataLoader.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 09/11/2023.
//

import Foundation
import Moya

class DataLoader {
    static var shared = DataLoader()
}

// MARK: - LoginService

extension DataLoader {

    func checkTokenAvailability(_ token: String,
                                handler: @escaping (Response?) -> Void) {
        MoyaProvider<BlizzardOAuth>().request(.checkToken(token: token)) { result in
            switch result {
            case let .success(response):
                handler(response)

            case let .failure(error):
                print("DataLoader > checkTokenAvailability: \(error)")
                handler(nil)
            }
        }
    }

    func fetchAccessToken(_ authToken: String,
                          handler: @escaping (Response?) -> Void) {
        MoyaProvider<BlizzardOAuth>().request(.token(code: authToken)) { result in
            switch result {
            case let .success(response):
                handler(response)

            case let .failure(error):
                print("DataLoader > fetchAccessToken: \(error)")
                handler(nil)
            }
        }
    }

}

// MARK: - MountListService

extension DataLoader {

    func fetchMounts(handler: @escaping (Response?) -> Void) {
        MoyaProvider<PAccountProfile>().request(.mounts) { result in
            switch result {
            case let .success(response):
                handler(response)

            case let .failure(error):
                print("DataLoader > fetchMounts: \(error)")
                handler(nil)
            }
        }
    }

    func fetchMountDetail(_ mountId: Int,
                          handler: @escaping (Response?) -> Void) {
        MoyaProvider<GDMount>().request(.mount(id: mountId)) { result in
            switch result {
            case let .success(response):
                handler(response)

            case let .failure(error):
                print("DataLoader > fetchMountDetail: \(error)")
                handler(nil)
            }
        }
    }
}

// MARK: - MountDetailService

extension DataLoader {

    func fetchCreatureDisplayMedia(id: Int,
                                   handler: @escaping (Response?) -> Void) {
        MoyaProvider<GDCreature>().request(.creatureDisplayMedia(id: id)) { result in
            switch result {
            case let .success(response):
                handler(response)

            case let .failure(error):
                print("DataLoader > fetchCreatureDisplay: \(error)")
                handler(nil)
            }
        }
    }
}
