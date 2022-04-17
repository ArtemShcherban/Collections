//
//  DictionaryMainView.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import UIKit

class DictionaryMainView: UIView {
    
    weak var delegate: DictionaryMainViewDelegate?
    
    lazy var arrayButton = BigButton()
    lazy var dictionaryButton = BigButton()
    private lazy var buttons = [arrayButton, dictionaryButton]
    
    func createMainView() {
        backgroundColor = .purple
        self.addSubview(arrayButton)
        self.addSubview(dictionaryButton)
        setButtonTitle()
        addButtonTarget()
        setButtonsConstraints()
    }
    
    func setButtonTitle() {
        arrayButton.setTitle(AppConstants.buttonsTitles[0], for: .normal)
        dictionaryButton.setTitle(AppConstants.buttonsTitles[1], for: .normal)
    }
    
    func addButtonTarget() {
        arrayButton.addTarget(delegate, action: #selector(delegate?.arrayButtonPressed), for: .touchUpInside)
        dictionaryButton.addTarget(delegate, action: #selector(delegate?.dictionaryButtonPressed), for: .touchUpInside)
    }
    
    func setButtonsConstraints() {
        var horizontalInterval: CGFloat = 0
        buttons.forEach { button in
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([button.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                                         constant: horizontalInterval),
                                         button.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                                         button.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 1),
                                         button.heightAnchor.constraint(equalToConstant: 100)])
           
            horizontalInterval += (UIScreen.main.bounds.width / 2) + 1
        }
    }
}

@objc protocol DictionaryMainViewDelegate: AnyObject {
    func arrayButtonPressed()
    func dictionaryButtonPressed()
}
