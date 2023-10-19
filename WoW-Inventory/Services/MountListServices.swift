//
//  MountListServices.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 12/10/2023.
//  Copyright © 2023 Baptistecdx. All rights reserved.
//

import Foundation
import Moya

class MountListServices {

    lazy var accountProfileProvider = {
        MoyaProvider<PAccountProfile>()
    }()

    func fetchMounts(handler: @escaping ([Mount]) -> Void) {
        accountProfileProvider.request(.mounts) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let data = moyaResponse.data
                    let decoder = JSONDecoder()
                    let mount = try decoder.decode(Mounts.self, from: data)
                    var mounts = mount.mounts

                    mounts.sort { mount1, mount2 in
                        let name1 = mount1.mountInfo.name
                        let name2 = mount2.mountInfo.name
                        let result = name1.compare(name2, options: .diacriticInsensitive)
                        return result == .orderedAscending
                    }

                    mounts.sort { firstMount, secondMount in
                        firstMount.isFav() && !secondMount.isFav()
                    }

                    handler(mounts)

                } catch {
                    print(error.localizedDescription)
                    handler([])
                }

            case let .failure(error):
                print(error)
                handler([])
            }
        }
    }
}
