//
//  DataLoader.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 09/11/2023.
//

import Foundation
import Alamofire

typealias WIResponse = AFDataResponse<Data>

class DataLoader {
    static var shared = DataLoader()

    private func request<T: WITargetType>(_ target: T,
                                          logContext: String,
                                          handler: @escaping (WIResponse?) -> Void) {
        AF.request(target.url,
                   method: target.method,
                   parameters: target.task.parameters,
                   encoding: target.task.encoding,
                   headers: target.headers)
        .responseData { response in
            switch response.result {
            case .success:
                handler(response)

            case let .failure(error):
                print("DataLoader > \(logContext): \(error)")
                handler(nil)
            }
        }
    }
}

// MARK: - HomeService

extension DataLoader {

    func fetchTokenPrice(handler: @escaping (WIResponse?) -> Void) {
        request(GDWoWToken.index, logContext: "fetchTokenPrice", handler: handler)
    }
}

// MARK: - LoginService

extension DataLoader {

    func checkTokenAvailability(_ token: String,
                                handler: @escaping (WIResponse?) -> Void) {
        request(BlizzardOAuth.checkToken(token: token),
                logContext: "checkTokenAvailability",
                handler: handler)
    }

    func fetchAccessToken(_ authToken: String,
                          handler: @escaping (WIResponse?) -> Void) {
        request(BlizzardOAuth.token(code: authToken),
                logContext: "fetchAccessToken",
                handler: handler)
    }

}

// MARK: - MountListService

extension DataLoader {

    func fetchMounts(handler: @escaping (WIResponse?) -> Void) {
        request(PAccountProfile.mounts, logContext: "fetchMounts", handler: handler)
    }

    func fetchMountDetail(_ mountId: Int,
                          handler: @escaping (WIResponse?) -> Void) {
        request(GDMount.mount(id: mountId), logContext: "fetchMountDetail", handler: handler)
    }
}

// MARK: - MountDetailService

extension DataLoader {

    func fetchCreatureDisplayMedia(id: Int,
                                   handler: @escaping (WIResponse?) -> Void) {
        request(GDCreature.creatureDisplayMedia(id: id),
                logContext: "fetchCreatureDisplay",
                handler: handler)
    }
}
