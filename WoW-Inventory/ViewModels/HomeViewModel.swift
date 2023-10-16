//
//  HomeViewModel.swift
//  World_of_Warcraft
//
//  Created by Baptiste Cadoux on 12/10/2023.
//  Copyright © 2023 Baptistecdx. All rights reserved.
//

import Foundation

class HomeViewModel {

    private var services = HomeServices()

    var mounts = [Mount]()

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
}
