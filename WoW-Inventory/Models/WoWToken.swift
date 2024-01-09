//
//  WoWToken.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 09/01/2024.
//

import Foundation

struct WoWToken: Decodable {
    let price: Int64

    func getFormattedPrice() -> String {
        var priceInGold = Int(price)
        priceInGold = priceInGold / 100 / 100
        return "\(priceInGold)"
    }
}
