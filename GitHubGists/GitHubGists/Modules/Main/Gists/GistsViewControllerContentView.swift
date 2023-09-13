
import UIKit

class GistsViewControllerContentView: ContentView {
    
    //MARK: - Views
    private(set) lazy var tableView = UITableView()
    
    //MARK: - Layout
    override func layout() {
        addSubview(tableView)
        tableView.backgroundColor = ColorPalette.appBackground
        backgroundColor = ColorPalette.appBackground
        layoutTableView()
        layoutSpinner()
    }

    private func layoutTableView() {
        embed(tableView)
    }
    
    override func layoutSpinner() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.startAnimating()
        
        addSubview(spinner)
        
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        spinner.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: -25).isActive = true
        spinner.color = ColorPalette.appCream
        spinner.isHidden = true
    }
}
