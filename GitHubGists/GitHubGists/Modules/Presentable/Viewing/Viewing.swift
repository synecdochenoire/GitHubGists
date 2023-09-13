//
//  Viewing.swift
//  GitHubGists
//
//  Created by Pasha Berger on 11.09.2023.
//

import Foundation
import UIKit

protocol Viewing: AnyObject {
    var asViewController: UIViewController { get }
    var asView: UIView { get }
    
    var title: String? { get set }
    
    func push(_ view: Viewing, animated: Bool)
    func pop(_ animated: Bool)
    func present(view: Viewing, animated: Bool, completion: EmptyClosure?)
    func dismissView(animated: Bool, completion: EmptyClosure?)
}

extension UIViewController: Viewing {
    var asViewController: UIViewController { self }
    var asView: UIView { view }
    
    func push(_ view: Viewing) {
        push(view, animated: true)
    }
    
    func push(_ view: Viewing, animated: Bool) {
        navigationController?.pushViewController(view.asViewController, animated: animated)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    func pop(_ animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }
    
    func present(_ view: Viewing, completion: EmptyClosure? = nil) {
        present(view: view, animated: true, completion: completion)
    }
    
    func present(view: Viewing, animated: Bool, completion: EmptyClosure?) {
        present(view.asViewController, animated: animated, completion: completion)
    }
    
    func dismissView(completion: EmptyClosure? = nil) {
        dismissView(animated: true, completion: completion)
    }
    
    func dismissView(animated: Bool, completion: EmptyClosure?) {
        dismiss(animated: animated, completion: completion)
    }
}
