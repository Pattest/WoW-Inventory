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
}
