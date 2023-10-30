//
//  UIImage+WI.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 30/10/2023.
//

import UIKit

enum AssetName: String {
    case backgroundApp
    case logoApp
    case mount
    case toy
}

extension AssetName {
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
    
}
