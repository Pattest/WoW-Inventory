//
//  Mount.swift
//  World_of_Warcraft
//
//  Created by Baptiste Cadoux on 12/10/2023.
//  Copyright © 2023 Baptistecdx. All rights reserved.
//

import Foundation

struct Mounts: Decodable {
    
    let mounts: [Mount]
    
}

struct Mount: Decodable {
    
    let mountInfo: MountInfo
    let isFavorite: Bool?
    
    enum CodingKeys: String, CodingKey {
        case mountInfo = "mount"
        case isFavorite = "is_favorite"
    }
    
}

struct MountInfo: Decodable {
    
    let id: Int
    let key: Key
    let name: String
    
}

struct Key: Decodable {

    let href: String

}
