//
//  MountListViewModel.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 12/10/2023.
//  Copyright © 2023 Baptistecdx. All rights reserved.
//

import Foundation

class MountListViewModel {

    private var services = MountListServices()

    var mounts = [Mount]()
    var selectedMount: Mount?

    func fetchMounts(handler: @escaping (Bool) -> Void) {
        services.fetchMounts() { mounts in
            self.mounts = mounts
            handler(!mounts.isEmpty)
        }
    }

    func fetchMountDetail(_ mountId: Int, handler: @escaping (Bool) -> Void) {
        services.fetchMountDetail(mountId) { [weak self] mountDetail in
            if let mountDetail {
                self?.selectedMount?.detail = mountDetail
                handler(true)
            } else {
                handler(false)
            }
        }
    }
}
