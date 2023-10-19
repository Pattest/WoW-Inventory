//
//  Mount.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 12/10/2023.
//  Copyright © 2023 Baptistecdx. All rights reserved.
//

import Foundation

struct Mounts: Decodable {
    let mounts: [Mount]
}

struct Mount: Decodable {
    let mountInfo: MountInformation
    let isFavorite: Bool?
    
    enum CodingKeys: String, CodingKey {
        case mountInfo = "mount"
        case isFavorite = "is_favorite"
    }

    func isFav() -> Bool {
        return isFavorite ?? false
    }
}

struct MountInformation: Decodable {
    let id: Int
    let key: Key
    let name: String
}

struct Key: Decodable {
    let href: String
}
