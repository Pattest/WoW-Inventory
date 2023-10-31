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

    func fetchMounts(handler: @escaping ([Mount]) -> Void) {
        MoyaProvider<PAccountProfile>().request(.mounts) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let data = moyaResponse.data
                    let decoder = JSONDecoder()
                    let mount = try decoder.decode(ResponseMount.self, from: data)
                    let sortedMounts = mount.getSortedMounts()
                    handler(sortedMounts)

                } catch {
                    print("fetchMounts: \(error.localizedDescription)")
                    handler([])
                }

            case let .failure(error):
                print("fetchMounts: \(error)")
                handler([])
            }
        }
    }

    func fetchMountDetail(_ mountId: Int, handler: @escaping (Mount.Detail?) -> Void) {
        MoyaProvider<GDMount>().request(.mount(id: mountId)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let data = moyaResponse.data
                    let decoder = JSONDecoder()
                    let mountDetail = try decoder.decode(Mount.Detail.self, from: data)
                    handler(mountDetail)

                } catch {
                    print("fetchMountDetail: \(error)")
                    handler(nil)
                }

            case let .failure(error):
                print("fetchMountDetail: \(error)")
                handler(nil)
            }
        }
    }
}
