//
//  UIView+CornerRadius.swift
//  GitHubGists
//
//  Created by Pasha Berger on 11.09.2023.
//

import Foundation
import UIKit

extension UIView {
    
    func addCorner(radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                   shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
                   shadowOpacity: Float = 0.4,
                   shadowRadius: CGFloat = 3.0) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }
}
