//
//  SetMainView.swift
//  Collections
//
//  Created by Artem Shcherban on 14.04.2022.
//

import UIKit

class SetMainView: UIView {
    
    lazy var textFieldFirst = CustomTextField()
    lazy var textFieldSecond = CustomTextField()
    lazy var buttonFirst = CustomButton()
    lazy var buttonSecond = CustomButton()
    lazy var buttonThird = CustomButton()
    lazy var buttons = [buttonFirst, buttonSecond, buttonThird]
    weak var delegate: SetMainViewDelegate?
    
    func createMainView() {
        backgroundColor = .white
        addSubviews()
        addTextFieldTarget()
        addTextFieldTag()
        addTextFieldDelegate()
        setButtonTitle()
        addButtonTarget()
        setTextFieldFirstConstraints()
        setTextFieldSecondConstraints()
        setButtonConstraints()
    }
    
    private func addSubviews() {
        self.addSubview(textFieldFirst)
        self.addSubview(textFieldSecond)
        self.addSubview(buttonFirst)
        self.addSubview(buttonSecond)
        self.addSubview(buttonThird)
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
                                                                         constant: CGFloat(AppConstants.textFieldHeight)),
                                     textFieldFirst.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                                             constant: Indents.left),
                                     textFieldFirst.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                                              constant: Indents.right)])
        
    }
    
    private func setTextFieldSecondConstraints() {
        NSLayoutConstraint.activate([textFieldSecond.topAnchor.constraint(equalTo: textFieldFirst.bottomAnchor,
                                                                          constant: CGFloat(AppConstants.textFieldHeight)),
                                     textFieldSecond.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                                                                              constant: Indents.left),
                                     textFieldSecond.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                                                                               constant: Indents.right)])
        
    }
    
    private func setButtonConstraints() {
        var lineSpasing: CGFloat = CGFloat(AppConstants.textFieldHeight)
        buttons.forEach { button in
            NSLayoutConstraint.activate([button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Indents.left),
                                         button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Indents.right),
                                         button.topAnchor.constraint(equalTo: textFieldSecond.bottomAnchor, constant: lineSpasing)])
            lineSpasing += 86
        }
    }
}

@objc protocol SetMainViewDelegate: UITextFieldDelegate {
    func buttonFirstTapped()
    func buttonSecondTapped()
    func buttonThirdTapped()
    func textFieldDidChange(_ sender: CustomTextField)
}
