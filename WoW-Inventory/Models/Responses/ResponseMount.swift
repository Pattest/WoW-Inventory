//
//  ResponseMount.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 23/10/2023.
//

import Foundation

struct ResponseMount: Decodable {
//    let links: Links
    let mounts: [Mount]

    func getSortedMounts() -> [Mount] {
        var sortedMounts = [Mount]()

        sortedMounts = mounts.sorted {
            let name1 = $0.detail.name
            let name2 = $1.detail.name
            let result = name1.compare(name2, options: .diacriticInsensitive)
            return result == .orderedAscending
        }

        sortedMounts.sort {
            $0.isFav() && !$1.isFav()
        }

        return sortedMounts
    }
}
