//
//  MountDetailViewModel.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 23/10/2023.
//

import Foundation

class MountDetailViewModel {

    private var service = MountDetailService()

    var mount: Mount?
    var assets = [Asset]()

}

// MARK: - Service

extension MountDetailViewModel {

    func fetchCreatureDisplayMedia(id: Int, handler: @escaping () -> Void) {
        service.fetchCreatureDisplayMedia(id: id) { [weak self] assets in
            self?.assets = assets
            handler()
        }
    }

}
