//
//  Mount.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 12/10/2023.
//  Copyright © 2023 Baptistecdx. All rights reserved.
//

import Foundation

struct Mount: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case detail = "mount"
        case isFavorite = "is_favorite"
    }

    var detail: Detail
    let isFavorite: Bool?
    
    func isFav() -> Bool {
        return isFavorite ?? false
    }
}

extension Mount {

    struct Detail: Decodable {
        
        enum CodingKeys: String, CodingKey {
            case id
            case key
            case name
            case creatureDisplays = "creature_displays"
            case description
            case source
            case faction
//            case requirements
        }

        let id: Int
        let key: Key?
        let name: String

        let creatureDisplays: [CreatureDisplay]?
        let description: String?
        let source: DataType?
        let faction: DataType?
//        let requirements: Requirements

        //

        func getCreatureDisplays() -> [CreatureDisplay] {
            return creatureDisplays ?? []
        }

        func getDescription() -> String {
            return description ?? ""
        }
    }

}
