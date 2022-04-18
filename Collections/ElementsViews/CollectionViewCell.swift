//
//  CollectionViewCell.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: CollectionViewCell.self)
    
    lazy var titleTextLabel: UILabel = {
        let tempTitleTextLabel = UILabel()
        tempTitleTextLabel.textAlignment = .center
        tempTitleTextLabel.numberOfLines = 0
        tempTitleTextLabel.textColor = ColorsConstants.blueColor
        tempTitleTextLabel.sizeToFit()
        tempTitleTextLabel.backgroundColor = .green
        return tempTitleTextLabel
    }()
    
    func cellConfigure(_ cellTitle: String) {
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.black.cgColor
        titleTextLabel.text = cellTitle
        self.addSubview(titleTextLabel)
        setTitleTextLabelConstraints()
    }
    
    func setTitleTextLabelConstraints() {
        titleTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([titleTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     titleTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     titleTextLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height / 5),
                                     titleTextLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor)])
    }
}
