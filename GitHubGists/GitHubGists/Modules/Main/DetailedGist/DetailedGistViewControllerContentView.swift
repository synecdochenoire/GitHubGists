
import UIKit

class DetailedGistViewControllerContentView: ContentView {
    
    //MARK: - Views
    
    private(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private(set) lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var usernameItem: GistItemView = {
        let item = GistItemView(title: Text.username)
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    
    private(set) lazy var ownerTypeItem: GistItemView = {
        let item = GistItemView(title: Text.ownerType)
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    
    private(set) lazy var descriptionItem: GistItemView = {
        let item = GistItemView(title: Text.description)
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    
    private(set) lazy var filenameItem: GistItemView = {
        let item = GistItemView(title: Text.filename)
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    
    private(set) lazy var languageItem: GistItemView = {
        let item = GistItemView(title: Text.language)
        item.translatesAutoresizingMaskIntoConstraints = false
        return item
    }()
    
    //MARK: - Layout
    
    override func layout() {
        backgroundColor = ColorPalette.appBackground
        
        addSubview(scrollView)
        
        embed(scrollView)
        
        scrollView.addSubview(containerView)
        scrollView.embed(containerView)
        
        containerView.addSubview(usernameItem)
        containerView.addSubview(ownerTypeItem)
        containerView.addSubview(descriptionItem)
        containerView.addSubview(filenameItem)
        containerView.addSubview(languageItem)
        
        layoutUsername()
        layoutOwner()
        layoutDescription()
        layoutFilename()
        layoutLanguage()
    }
    
    override func configure() {
        scrollView.delaysContentTouches = false
        scrollView.canCancelContentTouches = false
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    //MARK: - Private
    
    private func layoutUsername() {
        NSLayoutConstraint.activate([
            usernameItem.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            usernameItem.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8),
            usernameItem.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            usernameItem.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func layoutOwner() {
        filenameItem.setContentHuggingPriority(.defaultHigh, for: .vertical)
        NSLayoutConstraint.activate([
            ownerTypeItem.topAnchor.constraint(equalTo: usernameItem.bottomAnchor, constant: 20),
            ownerTypeItem.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8),
            ownerTypeItem.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            ownerTypeItem.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func layoutDescription() {
        descriptionItem.setContentCompressionResistancePriority(.required, for: .vertical)
        
        NSLayoutConstraint.activate([
            descriptionItem.topAnchor.constraint(equalTo: ownerTypeItem.bottomAnchor, constant: 20),
            descriptionItem.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8),
            descriptionItem.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    
    private func layoutFilename() {
        NSLayoutConstraint.activate([
            filenameItem.topAnchor.constraint(equalTo: descriptionItem.bottomAnchor, constant: 20),
            filenameItem.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8),
            filenameItem.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            filenameItem.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func layoutLanguage() {
        NSLayoutConstraint.activate([
            languageItem.topAnchor.constraint(equalTo: filenameItem.bottomAnchor, constant: 20),
            languageItem.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.8),
            languageItem.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            languageItem.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -50)
        ])
    }
    
    //MARK: - Internal
    
    func update(with gist: Gist) {
        usernameItem.set(content: gist.owner)
        ownerTypeItem.set(content: gist.ownerType)
        descriptionItem.set(content: gist.description)
        languageItem.set(content: gist.language ?? Text.placeholder)
        filenameItem.set(content: gist.filename ?? Text.placeholder)
    }
}
