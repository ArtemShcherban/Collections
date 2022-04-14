//
//  CustomTextField.swift
//  Collections
//
//  Created by Artem Shcherban on 14.04.2022.
//

import UIKit

final class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        setConstraints()
    }
    
    private func configure() {
        layer.borderColor = ColorsConstants.grayColor.cgColor
        layer.borderWidth = 0.7
        layer.cornerRadius = 10
        borderStyle = .roundedRect
        clipsToBounds = true
        backgroundColor = .white
    }
    
    private func setConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([self.heightAnchor.constraint(equalToConstant: CGFloat(AppConstants.textFieldHeight))])
    }
}
