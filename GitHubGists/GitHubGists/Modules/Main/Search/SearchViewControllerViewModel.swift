
import Foundation

class SearchViewControllerViewModel: ViewModel {
    
    //MARK: - Closures
    var didReceive: ((AppError) -> Void)?
    var usernamePassedValidation: ((String) -> Void)?
    var verificationService: UserVerificationServicable
    
    init(verificationService: UserVerificationServicable) {
        self.verificationService = verificationService
    }
    
    //MARK: - Methods
    func didEnter(username: String) {
        validate(string: username)
        ? verify(username)
        : didReceive?(ValidationError.invalid)
    }

    private func validate(string: String) -> Bool {
        let usernameRegExPattern = "^(?!-|_|.*--|.*-$|admin$|user$|repository$)[a-zA-Z0-9-_.]{1,39}$"
        
        let usernamePredication = NSPredicate(format:"SELF MATCHES %@", usernameRegExPattern)
       
        return usernamePredication.evaluate(with: string)
    }
    
    private func verify(_ username: String) {
        Task.init { 
            switch await verificationService.verify(username: username, page: 1) {
            case .success(_):
                DispatchQueue.main.async { [weak self] in
                    self?.usernamePassedValidation?(username)
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.didReceive?(error)
                }
            }
        }
    }
}
