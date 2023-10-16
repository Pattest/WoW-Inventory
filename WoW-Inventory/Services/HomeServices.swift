//
//  HomeServices.swift
//  World_of_Warcraft
//
//  Created by Baptiste Cadoux on 12/10/2023.
//  Copyright © 2023 Baptistecdx. All rights reserved.
//

import Foundation
import Moya

class HomeServices {

    let data = MoyaProvider<WoWCommunity>()

    func fetchMounts(handler: @escaping ([Mount]) -> Void) {
        data.request(.mounts) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let data = moyaResponse.data
                    let decoder = JSONDecoder()
                    let mount = try decoder.decode(Mounts.self, from: data)
                    handler(mount.mounts)

                } catch {
                    handler([])
                    print(error.localizedDescription)
                }

            case let .failure(error):
                handler([])
                print(error)
            }
        }
    }
}
