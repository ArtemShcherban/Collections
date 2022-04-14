//
//  CustomButton.swift
//  Collections
//
//  Created by Artem Shcherban on 14.04.2022.
//

import UIKit

final class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
   lazy var titleTextlabel: UILabel = {
        let tempTitleTextLabel = UILabel()
       tempTitleTextLabel.textAlignment = .center
       tempTitleTextLabel.textColor = ColorsConstants.blueColor
       tempTitleTextLabel.numberOfLines = 0
       tempTitleTextLabel.sizeToFit()
        return tempTitleTextLabel
    }()
    
    private func configure() {
        addSubview(titleTextlabel)
        titleLabel?.numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([heightAnchor.constraint(equalTo: titleTextlabel.heightAnchor)])
        setTitleLabelConstraint()
    }
    
    private func setTitleLabelConstraint() {
        titleTextlabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([titleTextlabel.topAnchor.constraint(equalTo: self.topAnchor),
                                     titleTextlabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     titleTextlabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     titleTextlabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)])
    }
}
