//
//  HomeViewModel.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 19/10/2023.
//

import Foundation

class HomeViewModel {

    private var service = HomeService()

    var cellTypes: [HomeCellType] = [
        .mount
    ]

}

// MARK: - Service

extension HomeViewModel {

    func fetchTokenPrice(handler: @escaping (String) -> Void) {
        service.fetchTokenPrice { tokenPrice in
            handler(tokenPrice)
        }
    }
}
