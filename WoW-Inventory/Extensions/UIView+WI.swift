//
//  UIView+WI.swift
//  WoW-Inventory
//
//  Created by Baptiste Cadoux on 30/10/2023.
//

import UIKit

extension UIView {
    
    // MARK: - Background color
    
    @discardableResult
    func backgroundColor(_ backgroundColor: UIColor) -> UIView {
        self.backgroundColor = backgroundColor
        return self
    }

    // MARK: - Corner

    @discardableResult
    func cornerRadius(_ cornerRadius: CGFloat) -> UIView {
        self.layer.cornerRadius = cornerRadius
        return self
    }

    // MARK: - Border

    @discardableResult
    func borderColor(_ borderColor: UIColor) -> UIView {
        self.layer.borderColor = borderColor.cgColor
        return self
    }

    @discardableResult
    func borderWidth(_ borderWidth: CGFloat) -> UIView {
        self.layer.borderWidth = borderWidth
        return self
    }

    // MARK: - Shadow

    @discardableResult
    func basicShadow() -> UIView {
        self.shadowColor(.black)
            .shadowOpacity(0.8)
            .shadowOffset(.zero)
            .shadowRadius(1)
        return self
    }

    @discardableResult
    func shadowColor(_ shadowColor: UIColor) -> UIView {
        self.layer.shadowColor = shadowColor.cgColor
        return self
    }
    
    @discardableResult
    func shadowOpacity(_ shadowOpacity: Float) -> UIView {
        self.layer.shadowOpacity = shadowOpacity
        return self
    }

    @discardableResult
    func shadowOffset(_ shadowOffset: CGSize) -> UIView {
        self.layer.shadowOffset = shadowOffset
        return self
    }

    @discardableResult
    func shadowRadius(_ shadowRadius: CGFloat) -> UIView {
        self.layer.shadowRadius = shadowRadius
        return self
    }
}
