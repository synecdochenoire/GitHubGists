//
//  GistTableViewCell.swift
//  GitHubGists
//
//  Created by Pasha Berger on 12.09.2023.
//

import UIKit

final class GistTableViewCell: UITableViewCell {
    
    var viewModel: GistTableViewCellViewModel? {
        didSet {
            descriptionLabel.text = viewModel?.description
        }
    }
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.systemBold(of: 16)
        label.textColor = ColorPalette.appLillic
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.contentMode = .center
        return label
    }()
    
    override func prepareForReuse() {
        descriptionLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.backgroundColor = ColorPalette.appLillicDark
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            descriptionLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 80),
            descriptionLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
   
}
