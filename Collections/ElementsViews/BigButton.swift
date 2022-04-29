//
//  BigButton.swift
//  Collections
//
//  Created by Artem Shcherban on 11.04.2022.
//

import UIKit

class BigButton: UIButton {
    
   private lazy var activityIndicator: UIActivityIndicatorView = {
        let tempIndicator = UIActivityIndicatorView()
        tempIndicator.style = .large
        return tempIndicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addActivityIndicator()
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addActivityIndicator()
        configure()
    }
    
    private func addActivityIndicator() {
        self.addSubview(activityIndicator)
        setActivityIndicatorConstraints()
    }
    
    private func configure() {
        setTitleColor(ColorsConstants.blueColor, for: .normal)
        backgroundColor = ColorsConstants.grayColor
        layer.borderWidth = 0.2
        layer.borderColor = UIColor.black.cgColor
    }
    
    func update(_ title: String = "") {
        if isSelected == false {
            setTitle(title, for: .normal)
            isSelected.toggle()
        } else {
            setTitle(title, for: .selected)
            backgroundColor = ColorsConstants.newColor
        }
    }
    
    func startActivityIndicator() {
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }
    
    private func setActivityIndicatorConstraints() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([activityIndicator.topAnchor.constraint(equalTo: self.topAnchor),
                                     activityIndicator.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     activityIndicator.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     activityIndicator.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}
