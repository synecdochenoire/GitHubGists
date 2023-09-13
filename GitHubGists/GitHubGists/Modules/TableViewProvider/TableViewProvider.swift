//
//  TableViewProvider.swift
//  GitHubGists
//
//  Created by Pasha Berger on 12.09.2023.
//

import Foundation
import UIKit

class TableViewProvider<TableView: UITableView, ViewModel>: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private(set) var viewModel: ViewModel
    private(set) weak var tableView: UITableView?
    
    init(tableView: TableView, viewModel: ViewModel) {
        self.tableView = tableView
        self.viewModel = viewModel
        
        super.init()
        self.configureTableView()
    }
    
    func configureTableView() {}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
}
