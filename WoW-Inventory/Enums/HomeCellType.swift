//
//  HomeCellType.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 19/10/2023.
//

import UIKit

enum HomeCellType {
    case mount

    var name: String {
        switch self {
        case .mount:
            return "Mount"
        }
    }

    var iconName: String {
        switch self {
        case .mount:
            return "mount"
        }
    }

    var backgroundColor: UIColor {
        switch self {
        case .mount:
            return .systemBrown
        }
    }
}
