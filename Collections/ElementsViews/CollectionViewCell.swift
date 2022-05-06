//
//  CollectionViewCell.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: CollectionViewCell.self)
    
    private(set) lazy var titleTextLabel: UILabel = {
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
    
    func configure(_ title: String) {
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.black.cgColor
        backgroundColor = ColorsConstants.grayColor
        titleTextLabel.text = title
        addTitleTextLabel()
        addActivityIndicator()
    }
    
    private func addTitleTextLabel() {
        self.addSubview(titleTextLabel)
        setTitleTextLabelConstraints()
    }
    
    func titleUpdate(_ title: String = "") {
        titleTextLabel.text = title
    }
    
    private func addActivityIndicator() {
        self.addSubview(activityIndicator)
        setActivityIndicatorConstraints()
    }
    
    func updateAppearance() {
        backgroundColor = ColorsConstants.newColor
        titleTextLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleTextLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    private func setTitleTextLabelConstraints() {
        titleTextLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([titleTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     titleTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     titleTextLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height / 7),
                                     titleTextLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor)])
    }
    
    private func setActivityIndicatorConstraints() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
    }
}
