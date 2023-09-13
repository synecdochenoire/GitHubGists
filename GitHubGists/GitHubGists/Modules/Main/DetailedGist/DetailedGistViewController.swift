
import UIKit

class DetailedGistViewController: Controller<DetailedGistViewControllerViewModel, DetailedGistViewControllerContentView> {
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Text.Titles.detailedGist
        
        configure()
        setupBackButton()
    }
    
    override func configure() {
        super.configure()
        
        bindViewModel()
    }
    
    //MARK: - Private
    private func bindViewModel() {
        contentView.update(with: viewModel.gist)
    }
}
