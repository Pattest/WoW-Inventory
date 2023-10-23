//
//  AssetResponse.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 23/10/2023.
//

import Foundation

struct ResponseAsset: Decodable {
//    let links: Links
//    let id: Int
    let assets: [Asset]
}
