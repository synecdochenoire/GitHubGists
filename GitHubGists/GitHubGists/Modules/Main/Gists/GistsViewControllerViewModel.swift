
import Foundation

class GistsViewControllerViewModel: ViewModel {
    
    //MARK: - Properties
    var gists: Observable<[Gist]> = Observable([])
    var username: String
    
    //MARK: - Closures
    var didSelectGist: ((Gist) -> Void)?
    var didReceive: ((AppError) -> Void)?
    var isLoading: Observable<Bool> = Observable(false)
    var scrolledToBottom: EmptyClosure?
    var currentPage = 1
    
    //MARK: - Services
    private var searchingService: GistsSearchingServicable
    
    //MARK: - Init
    init(username: String, searchingService: GistsSearchingServicable) {
        self.username = username
        self.searchingService = searchingService
        super.init()
    }
    
    //MARK: - Methods
    func didPulldown() {
        sendRequest(with: username, page: 1)
    }
    
    func viewDidLoad() {
        sendRequest(with: username, page: currentPage)
    }
    
    func didScrollToBottom() {
        sendRequest(with: username, page: currentPage)
    }
    
    private func sendRequest(with username: String, page: Int) {
        isLoading.value = true
        Task.init { [weak self] in
            switch await searchingService.searchForGists(with: username, page: currentPage) {
            case .success(let gists):
                DispatchQueue.main.async { [weak self] in
                    guard let strongSelf = self else { return }
                    strongSelf.gists.value.append(contentsOf: strongSelf.map(gists: gists))
                    strongSelf.currentPage += 1
                    self?.isLoading.value = false
                }
                
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.didReceive?(error)
                    self?.isLoading.value = false
                }
            }
        }
    }
    
    private func map(gists: [GitHubGist]) -> [Gist] {
        gists.map({
            Gist(
                description: $0.description.notEmpty ?? Text.placeholder,
                owner: $0.owner.login,
                ownerType: $0.owner.ownerType,
                filename: $0.files.first?.value.filename,
                language: $0.files.first?.value.language
            )
        })
    }
}
