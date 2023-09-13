//
//  ContentView.swift
//  GitHubGists
//
//  Created by Pasha Berger on 11.09.2023.
//

import Foundation
import UIKit

protocol ContentViewable: UIView {
    func layout()
}

class ContentView: UIView, ContentViewable {
    
    private(set) lazy var spinner = UIActivityIndicatorView(style: .large)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        layout()
    }
    
    func layout() {
        
    }
    
    func configure() {}
    
    func layoutSpinner() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        
        addSubview(spinner)
        
        spinner.heightAnchor.constraint(equalToConstant: 50).isActive = true
        spinner.widthAnchor.constraint(equalToConstant: 50).isActive = true
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        spinner.isHidden = true
    }
    
    func showSpinner() {
        spinner.startAnimating()
        spinner.isHidden = false
    }
    
    func hideSpinner() {
        spinner.stopAnimating()
        spinner.isHidden = true
    }
}
