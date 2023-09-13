//
//  GistItemView.swift
//  GitHubGists
//
//  Created by Pasha Berger on 12.09.2023.
//

import UIKit

class GistItemView: UIView {
    
    var title: String
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private(set) lazy var itemTitle: UILabel = {
        let label = UILabel()
        label.font = Fonts.systemBold(of: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = ColorPalette.appCream
        label.numberOfLines = 0
        label.text = title
        label.textAlignment = .left
        return label
    }()
    
    private(set) lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.systemRegular(of: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = ColorPalette.appCream
        label.numberOfLines = 0
        label.sizeToFit()
        label.textAlignment = .center
        return label
    }()
    
    override func layoutSubviews() {
        addSubview(itemTitle)
        addSubview(contentLabel)
        
        addCorner(radius: 12)
        addShadow()
        
        layer.borderColor = ColorPalette.appCream?.cgColor
        layer.borderWidth = 1
        
        layoutTitle()
        layoutContent()
    }
    
    private func layoutTitle() {
        NSLayoutConstraint.activate([
            itemTitle.heightAnchor.constraint(equalToConstant: 30),
            itemTitle.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75),
            itemTitle.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            itemTitle.topAnchor.constraint(equalTo: topAnchor, constant: 5)
        ])
    }
    
    private func layoutContent() {
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: itemTitle.bottomAnchor, constant: 15),
            contentLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contentLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    func set(content: String) {
        itemTitle.text = title
        contentLabel.text = content
    }
}
