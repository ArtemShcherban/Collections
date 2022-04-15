//
//  SetMainView.swift
//  Collections
//
//  Created by Artem Shcherban on 14.04.2022.
//

import UIKit

final class SetMainView: UIView {
    
    private lazy var textFieldFirst = CustomTextField()
    private lazy var textFieldSecond = CustomTextField()
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
        self.addSubview(textFieldFirst)
        self.addSubview(textFieldSecond)
        buttons.forEach { self.addSubview($0) }
        textLabels.forEach { self.addSubview($0) }
    }
    
    private func setConstraints() {
        setTextFieldFirstConstraints()
        setTextFieldSecondConstraints()
        setButtonConstraints()
        setTextLabelsConstraints()
    }
    
    private func addTextFieldTarget() {
        textFieldFirst.addTarget(delegate, action: #selector(delegate?.textFieldDidChange), for: .editingChanged)
        textFieldSecond.addTarget(delegate, action: #selector(delegate?.textFieldDidChange), for: .editingChanged)
    }
    
    private func addTextFieldTag() {
        textFieldFirst.tag = 1
        textFieldSecond.tag = 2
    }
    
    private func addTextFieldDelegate() {
        textFieldFirst.delegate = delegate
        textFieldSecond.delegate = delegate
    }
    
    private func setButtonTitle() {
        for (index, button) in buttons.enumerated() {
            button.titleTextlabel.text = AppConstants.buttonsTitles[index]
        }
    }
    
    private func addButtonTarget() {
        buttonFirst.addTarget(delegate, action: #selector(delegate?.buttonFirstTapped), for: .touchUpInside)
        buttonSecond.addTarget(delegate, action: #selector(delegate?.buttonSecondTapped), for: .touchUpInside)
        buttonThird.addTarget(delegate, action: #selector(delegate?.buttonThirdTapped), for: .touchUpInside)
    }
    
    private func setTextFieldFirstConstraints() {
        NSLayoutConstraint.activate([textFieldFirst.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
                                                                         constant: AppConstants.textViewHeight),
                                     textFieldFirst.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                                             constant: Indents.left),
                                     textFieldFirst.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                                              constant: Indents.right)])
        
    }
    
    private func setTextFieldSecondConstraints() {
        NSLayoutConstraint.activate([textFieldSecond.topAnchor.constraint(equalTo: textFieldFirst.bottomAnchor,
                                                                          constant: AppConstants.textViewHeight),
                                     textFieldSecond.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                                              constant: Indents.left),
                                     textFieldSecond.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                                               constant: Indents.right)])
        
    }
    
    private func setButtonConstraints() {
        var lineSpasing = AppConstants.textViewHeight
        buttons.forEach { button in
            NSLayoutConstraint.activate([button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Indents.left),
                                         button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Indents.right),
                                         button.topAnchor.constraint(equalTo: textFieldSecond.bottomAnchor, constant: lineSpasing)])
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
