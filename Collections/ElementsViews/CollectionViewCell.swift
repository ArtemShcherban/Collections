//
//  CollectionViewCell.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: CollectionViewCell.self)
    
    lazy var titleTextLabel: UILabel = {
        let tempTitleTextLabel = UILabel()
        tempTitleTextLabel.textAlignment = .center
        tempTitleTextLabel.numberOfLines = 0
        tempTitleTextLabel.textColor = ColorsConstants.blueColor
        tempTitleTextLabel.sizeToFit()
        return tempTitleTextLabel
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let tempActivityindicator = UIActivityIndicatorView()
        tempActivityindicator.style = .medium
        return tempActivityindicator
    }()
    
    func cellConfigure(_ cellTitle: String) {
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.black.cgColor
        backgroundColor = ColorsConstants.grayColor
        titleTextLabel.text = cellTitle
        addTitleTextLabel()
        addActivityIndicator()
    }
    
    func addTitleTextLabel() {
        self.addSubview(titleTextLabel)
        setTitleTextLabelConstraints()
    }
    
    func titleUpdate(_ title: String = "") {
        titleTextLabel.text = title
    }
    
    func addActivityIndicator() {
        self.addSubview(activityIndicator)
        setActivityIndicatorConstraints()
    }
    
    func updateBackgroundColor() {
        backgroundColor = ColorsConstants.newColor
    }
    
    func setTitleTextLabelConstraints() {
        titleTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([titleTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     titleTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     titleTextLabel.topAnchor.constraint(equalTo: self.topAnchor),
                                     titleTextLabel.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor)])
    }
    
    func setActivityIndicatorConstraints() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
    }
}
