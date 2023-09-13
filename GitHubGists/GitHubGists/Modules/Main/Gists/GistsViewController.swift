
import UIKit

class GistsViewController: Controller<GistsViewControllerViewModel, GistsViewControllerContentView> {
    
    //MARK: - Properties
    
    var provider: GistsTableViewProvider?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Text.Titles.gists
        
        setupBackButton()
        viewModel.viewDidLoad()
        observeViewModel()
    }

    override func configure() {
        super.configure()
        provider = GistsTableViewProvider(tableView: contentView.tableView, viewModel: viewModel)
    }
    
    //MARK: - Private
    
    private func observeViewModel() {
        viewModel.isLoading.bind { [weak self] needToShowSpinner in
            needToShowSpinner
            ? self?.contentView.showSpinner()
            : self?.contentView.hideSpinner()
        }
    }
}
