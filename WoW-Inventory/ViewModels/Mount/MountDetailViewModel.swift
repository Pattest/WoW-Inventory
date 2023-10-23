//
//  MountDetailViewModel.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 23/10/2023.
//

import Foundation

class MountDetailViewModel {

    private var services = MountDetailServices()

    var mount: Mount?
    var assets = [Asset]()

    func fetchCreatureDisplayMedia(id: Int,
                                   handler: @escaping () -> Void) {
        services.fetchCreatureDisplayMedia(id: id) { [weak self] assets in
            self?.assets = assets
            handler()
        }
    }
}
