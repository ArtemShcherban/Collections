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
        return tempTitleTextLabel
    }()
    
    func cellConfigure() {
        self.addSubview(titleTextLabel)
        setTitleTextLabelConstraints()
    }
    
    func setTitleTextLabelConstraints() {
        
    }
}
