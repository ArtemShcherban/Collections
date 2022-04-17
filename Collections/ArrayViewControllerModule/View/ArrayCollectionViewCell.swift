//
//  NewCollection.swift
//  Collections
//
//  Created by Artem Shcherban on 09.04.2022.
//

import UIKit

class ArrayCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: ArrayCollectionViewCell.self)
    
    private lazy var textLabel: UILabel = {
        let tempTextLabel = UILabel()
        tempTextLabel.textAlignment = .center
        tempTextLabel.numberOfLines = 0
        tempTextLabel.textColor = ColorsConstants.blueColor
        tempTextLabel.sizeToFit()
        return tempTextLabel
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let tempIndicator = UIActivityIndicatorView()
        tempIndicator.style = .medium
        return tempIndicator
    }()
    
    func configure(title: String) {
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.2
        clipsToBounds = true
        backgroundColor = ColorsConstants.grayColor
        textLabel.text = title
        self.addSubview(textLabel)
        setTextLabelConstraints()
    }
    
    private func createActivityIndicator() {
        self.addSubview(activityIndicator)
        setActivityIndicatorConstraints()
    }
    
    func startActivityIndicator() {
        createActivityIndicator()
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
    func textLabelUpdate(_ title: String = "") {
        textLabel.text = title
        NSLayoutConstraint.activate([textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
    }
    
    private func setTextLabelConstraints() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     textLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height / 5),
                                     textLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor)])
    }
    
    private func setActivityIndicatorConstraints() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
    }
}
