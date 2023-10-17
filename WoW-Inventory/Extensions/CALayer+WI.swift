//
//  CALayer+WI.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 17/10/2023.
//

import UIKit


extension CALayer {

    // MARK: - Corner

    @discardableResult
    func cornerRadius(_ cornerRadius: CGFloat) -> CALayer {
        self.cornerRadius = cornerRadius
        return self
    }

    // MARK: - Border

    @discardableResult
    func borderColor(_ borderColor: UIColor) -> CALayer {
        self.borderColor = borderColor.cgColor
        return self
    }

    @discardableResult
    func borderWidth(_ borderWidth: CGFloat) -> CALayer {
        self.borderWidth = borderWidth
        return self
    }

    // MARK: - Shadow

    @discardableResult
    func basicShadow() -> CALayer {
        self.shadowColor(.black)
            .shadowOpacity(1.0)
            .shadowOffset(.zero)
            .shadowRadius(1)
        return self
    }

    @discardableResult
    func shadowColor(_ shadowColor: UIColor) -> CALayer {
        self.shadowColor = shadowColor.cgColor
        return self
    }
    
    @discardableResult
    func shadowOpacity(_ shadowOpacity: Float) -> CALayer {
        self.shadowOpacity = shadowOpacity
        return self
    }

    @discardableResult
    func shadowOffset(_ shadowOffset: CGSize) -> CALayer {
        self.shadowOffset = shadowOffset
        return self
    }

    @discardableResult
    func shadowRadius(_ shadowRadius: CGFloat) -> CALayer {
        self.shadowRadius = shadowRadius
        return self
    }
}
