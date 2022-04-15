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
        setConstraints()
        setTitleLabelConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        setConstraints()
        setTitleLabelConstraint()
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

    }
    
    private func setConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: titleTextlabel.heightAnchor).isActive = true
    }

    private func setTitleLabelConstraint() {
        titleTextlabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([titleTextlabel.topAnchor.constraint(equalTo: self.topAnchor),
                                     titleTextlabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     titleTextlabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     titleTextlabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 0)])
    }
}
