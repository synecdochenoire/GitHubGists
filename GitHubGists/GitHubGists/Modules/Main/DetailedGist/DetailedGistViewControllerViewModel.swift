
import Foundation

class DetailedGistViewControllerViewModel: ViewModel {
    var gist: Gist
    
    init(gist: Gist) {
        self.gist = gist
    }
}
