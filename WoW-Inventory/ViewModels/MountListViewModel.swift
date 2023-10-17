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

    private var mounts = [Mount]()

    func fetchMounts(handler: @escaping (Bool) -> Void) {
        services.fetchMounts() { mounts in
            if !mounts.isEmpty {
                self.mounts = mounts
                handler(true)
            } else {
                handler(false)
            }
        }
    }

    func getMounts() -> [Mount] {
        return mounts
    }
}
