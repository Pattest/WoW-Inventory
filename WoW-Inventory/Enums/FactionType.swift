//
//  FactionType.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 24/10/2023.
//

import UIKit

enum FactionType: String {
    case alliance = "ALLIANCE"
    case horde = "HORDE"

    var iconName: String {
        switch self {
        case .alliance:
            return "]"
        case .horde:
            return "["
        }
    }

    var iconColor: UIColor {
        switch self {
        case .alliance:
            return .systemBlue
        case .horde:
            return .systemRed
        }
    }
}
