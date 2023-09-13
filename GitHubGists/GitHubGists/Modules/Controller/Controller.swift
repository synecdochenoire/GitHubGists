//
//  Controller.swift
//  GitHubGists
//
//  Created by Pasha Berger on 11.09.2023.
//

import Foundation
import UIKit

class Controller<ViewModel: ViewModeling, ContentView: ContentViewable>: UIViewController {
    
    var viewModel: ViewModel
    var contentView: ContentView
    
    init(viewModel: ViewModel, contentView: ContentView) {
        self.viewModel = viewModel
        self.contentView = contentView
        
        super.init(nibName: nil, bundle: nil)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    override func loadView() {
        view = contentView
    }

    func configure() {}
    
    func setupBackButton() {
        let backButton = UIBarButtonItem(
            image: Images.chevronLeft, style: .plain, target: self, action: #selector(didPressBack))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func didPressBack() {
        viewModel.didPressBack?()
        navigationController?.popViewController(animated: true)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = ColorPalette.appBackground
        appearance.titleTextAttributes = [.font: Fonts.systemBold(of: 24),
                                          .foregroundColor: ColorPalette.appCream]
        appearance.largeTitleTextAttributes = [.foregroundColor: ColorPalette.appCream]
    
        navigationController?.navigationBar.tintColor = ColorPalette.appCream
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func showAlert(with message: String) {
        let alertVC = UIAlertController(title: Text.Alert.errorOccured, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: Text.Alert.ok, style: .cancel)
        alertVC.addAction(action)
        present(alertVC)
    }
}
