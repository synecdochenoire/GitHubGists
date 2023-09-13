
import UIKit

class SearchViewController: Controller<SearchViewControllerViewModel, SearchViewControllerContentView> {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configure()
        observeContentView()
        observeErrors()
    }
    
    override func configure() {
        super.configure()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: - Private
    
    private func observeContentView() {
        contentView.willSearchUsername = { [weak self] in
            self?.contentView.showSpinner()
            self?.viewModel.didEnter(username: $0)
        }
    }
    
    private func observeErrors() {
        viewModel.didReceive = { [weak self] error in
            self?.contentView.hideSpinner()
            switch error.type {
            case .validation:
                self?.contentView.showError()
            default:
                self?.showAlert(with: error.localizedDescription)
            }
        }
    }
}
