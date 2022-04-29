//
//  SetMainView.swift
//  Collections
//
//  Created by Artem Shcherban on 14.04.2022.
//

import UIKit

final class SetMainView: UIView {
    
    private lazy var upperTextField = CustomTextField()
    private lazy var bottomTextField = CustomTextField()
    private lazy var buttonFirst = CustomButton()
    private lazy var buttonSecond = CustomButton()
    private lazy var buttonThird = CustomButton()
    lazy var textLabelFirst = CustomTextLabel()
    lazy var textLabelSecond = CustomTextLabel()
    lazy var textLabelThird = CustomTextLabel()
    private lazy var textLabels = [textLabelFirst, textLabelSecond, textLabelThird]
    private lazy var buttons = [buttonFirst, buttonSecond, buttonThird]
    weak var delegate: SetMainViewDelegate?
    
    func createMainView() {
        backgroundColor = .white
        addSubviews()
        addTextFieldTarget()
        addTextFieldTag()
        addTextFieldDelegate()
        setButtonTitle()
        addButtonTarget()
        setConstraints()
    }
    
    private func addSubviews() {
        self.addSubview(upperTextField)
        self.addSubview(bottomTextField)
        buttons.forEach { self.addSubview($0) }
        textLabels.forEach { self.addSubview($0) }
        addAccessibilityIdentifier()
    }
    
    private func setConstraints() {
        setTextFieldFirstConstraints()
        setTextFieldSecondConstraints()
        setButtonConstraints()
        setTextLabelsConstraints()
    }
    
    private func addTextFieldTarget() {
        upperTextField.addTarget(delegate, action: #selector(delegate?.textFieldDidChange), for: .editingChanged)
        bottomTextField.addTarget(delegate, action: #selector(delegate?.textFieldDidChange), for: .editingChanged)
    }
    
    private func addTextFieldTag() {
        upperTextField.tag = 1
        bottomTextField.tag = 2
    }
    
    private func addTextFieldDelegate() {
        upperTextField.delegate = delegate
        bottomTextField.delegate = delegate
    }
    
    private func setButtonTitle() {
        for (index, button) in buttons.enumerated() {
            button.titleTextlabel.text = AppConstants.setButtonsTitles[index]
        }
    }
    
    private func addButtonTarget() {
        buttonFirst.addTarget(delegate, action: #selector(delegate?.buttonFirstTapped), for: .touchUpInside)
        buttonSecond.addTarget(delegate, action: #selector(delegate?.buttonSecondTapped), for: .touchUpInside)
        buttonThird.addTarget(delegate, action: #selector(delegate?.buttonThirdTapped), for: .touchUpInside)
    }
    
    private func addAccessibilityIdentifier() {
        upperTextField.accessibilityIdentifier = AppConstants.upperTextFieldID
        bottomTextField.accessibilityIdentifier = AppConstants.bottomTextFieldID
        buttonFirst.accessibilityIdentifier = AppConstants.buttonFirstID
        buttonSecond.accessibilityIdentifier = AppConstants.buttonSecondID
        buttonThird.accessibilityIdentifier = AppConstants.buttonThirdID
        textLabelFirst.accessibilityIdentifier = AppConstants.textLabelFirstID
        textLabelSecond.accessibilityIdentifier = AppConstants.textLabelSecondID
        textLabelThird.accessibilityIdentifier = AppConstants.textLabelThirdID
    }
    
    private func setTextFieldFirstConstraints() {
        NSLayoutConstraint.activate([upperTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                                                         constant: AppConstants.textViewHeight),
                                     upperTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                                             constant: Indents.left),
                                     upperTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                                              constant: Indents.right)])
        
    }
    
    private func setTextFieldSecondConstraints() {
        NSLayoutConstraint.activate([bottomTextField.topAnchor.constraint(equalTo: upperTextField.bottomAnchor,
                                                                          constant: AppConstants.textViewHeight),
                                     bottomTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                                              constant: Indents.left),
                                     bottomTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                                               constant: Indents.right)])
        
    }
    
    private func setButtonConstraints() {
        var lineSpasing = AppConstants.textViewHeight
        buttons.forEach { button in
            NSLayoutConstraint.activate([button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Indents.left),
                                         button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Indents.right),
                                         button.topAnchor.constraint(equalTo: bottomTextField.bottomAnchor, constant: lineSpasing)])
            lineSpasing += 86
        }
    }
    
    private func setTextLabelsConstraints() {
        let lineSpasing: CGFloat = 7
        for (index, textLabel) in textLabels.enumerated() {
            NSLayoutConstraint.activate([textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Indents.left),
                                         textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Indents.right),
                                         textLabel.topAnchor.constraint(equalTo: buttons[index].bottomAnchor, constant: lineSpasing)])
        }
    }
}

@objc protocol SetMainViewDelegate: UITextFieldDelegate {
    func buttonFirstTapped()
    func buttonSecondTapped()
    func buttonThirdTapped()
    func textFieldDidChange(_ sender: CustomTextField)
}
