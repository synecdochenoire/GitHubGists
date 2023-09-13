//
//  ViewModel.swift
//  GitHubGists
//
//  Created by Pasha Berger on 11.09.2023.
//

import Foundation

protocol ViewModeling {
    var didPressBack: EmptyClosure? { get }
}

class ViewModel: ViewModeling {
    
    var didPressBack: EmptyClosure?
    
    init() {
        
    }
    
    func configure() {
        
    }
}
