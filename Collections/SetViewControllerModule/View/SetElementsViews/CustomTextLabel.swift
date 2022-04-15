//
//  CustomTextLabel.swift
//  Collections
//
//  Created by Artem Shcherban on 15.04.2022.
//

import UIKit

final class CustomTextLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: AppConstants.textViewHeight).isActive = true
        textAlignment = .center
    }
}
