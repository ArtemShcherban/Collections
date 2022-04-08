//
//  InitialTableViewCell.swift
//  Collections
//
//  Created by Artem Shcherban on 07.04.2022.
//

import UIKit

final class InitialTableViewCell: UITableViewCell {
    static let reuseIdentifier = String(describing: InitialTableViewCell.self)
    
    private lazy var rightArrowView = UIImageView()
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        print("Something")
//    }
    
    func configure(title: String) {
        var cellContent = self.defaultContentConfiguration()
        cellContent.attributedText = NSMutableAttributedString(string: title,
                                                               attributes: [NSAttributedString.Key.foregroundColor:
                                                                                ColorsConstants.graphiteColor])
        self.contentConfiguration = cellContent
        
        rightArrowView.image = AppConstants.rightArrowImage?.withTintColor(ColorsConstants.graphiteColor.withAlphaComponent(0.25))
        self.addSubview(rightArrowView)
        setRightArrowViewConstraints()
    }
    
    private func setRightArrowViewConstraints() {
        rightArrowView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([rightArrowView.heightAnchor.constraint(equalToConstant: 24),
                                     rightArrowView.widthAnchor.constraint(equalToConstant: 24),
                                     rightArrowView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
                                     rightArrowView.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
    }
}
