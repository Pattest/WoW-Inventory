//
//  HomeService.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 09/01/2024.
//

import Foundation

protocol HomeServiceProtocol: AnyObject {
    func fetchTokenPrice(handler: @escaping (String) -> Void)
}

class HomeService: HomeServiceProtocol {

    func fetchTokenPrice(handler: @escaping (String) -> Void) {
        DataLoader.shared.fetchTokenPrice { response in
            guard let response else { return handler("") }

            do {
                let data = response.data
                let decoder = JSONDecoder()
                let wowToken = try decoder.decode(WoWToken.self, from: data)
                handler(wowToken.getFormattedPrice())

            } catch {
                print("HomeService > fetchTokenPrice: \(error.localizedDescription)")
                handler("")
            }
        }
    }

}
