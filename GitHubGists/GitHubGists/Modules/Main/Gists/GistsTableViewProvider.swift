//
//  GistsTableViewProvider.swift
//  GitHubGists
//
//  Created by Pasha Berger on 12.09.2023.
//

import Foundation
import UIKit

final class GistsTableViewProvider: TableViewProvider<UITableView, GistsViewControllerViewModel> {
    
    override func configureTableView() {
        super.configureTableView()
        
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.separatorColor = ColorPalette.appCream
        tableView?.register(GistTableViewCell.self)
        tableView?.tableHeaderView = UIView()
        tableView?.rowHeight = 150
        tableView?.estimatedRowHeight = 150
        
        tableView?.refreshControl = UIRefreshControl()
        tableView?.refreshControl?.addTarget(self, action: #selector(pullDown), for: .valueChanged)
        tableView?.refreshControl?.tintColor = ColorPalette.appCream
        
        observeViewModel()
    }
    
    @objc func pullDown() {
        viewModel.didPulldown()
        DispatchQueue.main.async {
            self.tableView?.refreshControl?.endRefreshing() }
    }
    
    private func observeViewModel() {
        viewModel.gists.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView?.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: GistTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let viewModel = GistTableViewCellViewModel(description: viewModel.gists.value[indexPath.row].description)
        
        cell.viewModel = viewModel
        cell.isUserInteractionEnabled = true
        cell.selectionStyle = .none
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastRowIndex = tableView.numberOfRows(inSection: 0) - 1
        if indexPath.row == lastRowIndex {
            viewModel.didScrollToBottom()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.gists.value.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectGist?(viewModel.gists.value[indexPath.row])
    }
}
