
import UIKit

class SearchViewControllerContentView: ContentView {
    
    //MARK: - Closures
    var willSearchUsername: ((String) -> Void)?
    
    //MARK: - Views
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Text.appName
        label.font = Fonts.systemBold(of: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = ColorPalette.appLillic
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private(set) lazy var usernameField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = Text.username
        textfield.backgroundColor = ColorPalette.appCream
        textfield.tintColor = ColorPalette.appBlack
        textfield.addCorner(radius: 12)
        textfield.setLeftPaddingPoints(10)
        textfield.autocorrectionType = .no
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private(set) lazy var invalidUsername: UILabel = {
        let label = UILabel()
        label.textColor = ColorPalette.appRed
        label.text = Text.Errors.invalidUsername
        label.font = Fonts.systemRegular(of: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    private(set) lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle(Text.search, for: .normal)
        button.backgroundColor = ColorPalette.appLillicDark
        button.addCorner(radius: 12)
        button.addShadow()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(ColorPalette.appCream, for: .normal)
        return button
    }()
    
    //MARK: - Layout
    
    override func layout() {
        super.layout()
        addSubview(usernameField)
        addSubview(searchButton)
        addSubview(titleLabel)
        addSubview(invalidUsername)
        
        addConstrains()
    }
    
    override func configure() {
        backgroundColor = ColorPalette.appBackground
        
        addObservers()
        
        searchButton.addTarget(self, action: #selector(didPressSearch), for: .touchUpInside)
    }
    
    //MARK: - Private
    
    private func addTextFieldConstraints() {
        NSLayoutConstraint.activate([
            usernameField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            usernameField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            usernameField.heightAnchor.constraint(equalToConstant: 50),
            usernameField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75)
        ])
    }
    
    private func addSearchButtonConstraints() {
        NSLayoutConstraint.activate([
            searchButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: 50),
            searchButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75),
            searchButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    private func addTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 200),
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100)
        ])
    }
    
    private func addErrorLabelConstraints() {
        NSLayoutConstraint.activate([
            invalidUsername.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            invalidUsername.heightAnchor.constraint(equalToConstant: 30),
            invalidUsername.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75),
            invalidUsername.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 10)
        ])
    }
    
    private func addConstrains() {
        addTextFieldConstraints()
        addSearchButtonConstraints()
        addTitleLabelConstraints()
        addErrorLabelConstraints()
    }
    
    private func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - Internal
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if frame.origin.y == 0 {
                frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if frame.origin.y != 0 {
            frame.origin.y = 0
        }
    }
    
    @objc func didPressSearch() {
        willSearchUsername?(usernameField.text ?? "")
    }
    
    func showError() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        
        usernameField.layer.add(animation, forKey: "shake")
        usernameField.layer.borderColor = ColorPalette.appRed?.cgColor
        usernameField.layer.borderWidth = 1
        
        invalidUsername.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.invalidUsername.isHidden = true
            self?.usernameField.layer.borderColor = nil
            self?.usernameField.layer.borderWidth = 0
        }
    }
}
