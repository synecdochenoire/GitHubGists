//
//  UIView+Embed.swift
//  GitHubGists
//
//  Created by Pasha Berger on 12.09.2023.
//

import UIKit

extension UIView {
    func embed(_ childView: UIView, insets: UIEdgeInsets = .zero) {
        childView.translatesAutoresizingMaskIntoConstraints = false
        
        if childView.superview != self {
            addSubview(childView)
        }
        
        NSLayoutConstraint.activate([
            childView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets.left),
            trailingAnchor.constraint(equalTo: childView.trailingAnchor, constant: insets.right),
            childView.topAnchor.constraint(equalTo: topAnchor, constant: insets.top),
            bottomAnchor.constraint(equalTo: childView.bottomAnchor, constant: insets.bottom)
        ])
    }
    
    func embed(in parentView: UIView, insets: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if superview != parentView {
            parentView.addSubview(self)
        }
        
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: insets.left),
            parentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: insets.right),
            topAnchor.constraint(equalTo: parentView.topAnchor, constant: insets.top),
            parentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: insets.bottom)
        ])
    }
}
