//
//  MountListService.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 12/10/2023.
//  Copyright © 2023 Baptistecdx. All rights reserved.
//

import Foundation

protocol MountListServiceProtocol {
    func fetchMounts(handler: @escaping ([Mount]) -> Void)
    func fetchMountDetail(_ mountId: Int, handler: @escaping (Mount.Detail?) -> Void)
}

class MountListService: MountListServiceProtocol {

    func fetchMounts(handler: @escaping ([Mount]) -> Void) {
        DataLoader.shared.fetchMounts { response in
            guard let response else { return handler([]) }

            do {
                let data = response.data
                let decoder = JSONDecoder()
                let mount = try decoder.decode(ResponseMount.self, from: data)
                let sortedMounts = mount.getSortedMounts()
                handler(sortedMounts)

            } catch {
                print("MountListService > fetchMounts: \(error.localizedDescription)")
                handler([])
            }
        }
    }

    func fetchMountDetail(_ mountId: Int, handler: @escaping (Mount.Detail?) -> Void) {
        DataLoader.shared.fetchMountDetail(mountId) { response in
            guard let response else { return handler(nil) }

            do {
                let data = response.data
                let decoder = JSONDecoder()
                let mountDetail = try decoder.decode(Mount.Detail.self, from: data)
                handler(mountDetail)

            } catch {
                print("MountListService > fetchMountDetail: \(error)")
                handler(nil)
            }
        }
    }
}
