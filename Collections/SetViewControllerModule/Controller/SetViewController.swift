//
//  SetViewController.swift
//  Collections
//
//  Created by Artem Shcherban on 08.04.2022.
//

import UIKit

final class SetViewController: UIViewController {
    
    private lazy var setWorkingModel = SetWorkingModel()
    
    private lazy var setMainView: SetMainView? = {
        let view = SetMainView()
        view.delegate = self
        return view
    }()
    
    override func loadView() {
        view = setMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMainView?.createMainView()
        setupHideKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createNavigationBar(for: SetViewController.self)
    }
    
    private func setupHideKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension SetViewController: SetMainViewDelegate {
    
    func textFieldDidChange(_ sender: CustomTextField) {
        sender.text = setWorkingModel.inputHandling(sender.tag, sender.text ?? "")
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if let textField = textField as? CustomTextField {
            textField.isActive = true
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let textField = textField as? CustomTextField {
            textField.isActive = false
        }
        return true
    }
    
    func buttonFirstTapped() {
        setMainView?.textLabelFirst.text = setWorkingModel.searchMatchingCharacters()
    }
    
    func buttonSecondTapped() {
        setMainView?.textLabelSecond.text = setWorkingModel.searchNotMatchingCharacters()
    }
    
    func buttonThirdTapped() {
        setMainView?.textLabelThird.text = setWorkingModel.searchUniqueCharacters()
    }
}
