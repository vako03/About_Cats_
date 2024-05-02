//
//  CustomCell.swift
//  About_Cats_
//
//  Created by vako on 02.05.24.
//

import UIKit
import MyLibraryAboutCats


class CustomCell: UITableViewCell {
    
    // MARK: - Properties
    
    let factLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(factLabel)
        
        NSLayoutConstraint.activate([
            factLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            factLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            factLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            factLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
        backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell Configuration
    
    func configure(with text: String) {
        factLabel.text = text
    }
}
