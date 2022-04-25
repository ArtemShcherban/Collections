//
//  CustomTextField.swift
//  Collections
//
//  Created by Artem Shcherban on 14.04.2022.
//

import UIKit

final class CustomTextField: UITextField {
    
    private lazy var activeColor = ColorsConstants.blueColor.cgColor
    private lazy var inactiveColor = ColorsConstants.grayColor.cgColor
    
    lazy var isActive = false {
        didSet {
            if oldValue != isActive {
                borderColorUpdate()
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        borderColorUpdate()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        borderColorUpdate()
        setConstraints()
    }
    
    private func borderColorUpdate() {
        layer.borderColor = isActive ? activeColor : inactiveColor
    }
    
    private func configure() {
        autocorrectionType = .no
        spellCheckingType = .no
        layer.borderWidth = 0.7
        layer.cornerRadius = 10
        borderStyle = .roundedRect
        clipsToBounds = true
        backgroundColor = .white
    }
    
    private func setConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: AppConstants.textViewHeight).isActive = true
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
}
