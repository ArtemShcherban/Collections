//
//  SetViewController.swift
//  Collections
//
//  Created by Artem Shcherban on 08.04.2022.
//

import UIKit

class SetViewController: UIViewController {
   
    private lazy var setMainModel = SetMainModel()
    
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
        title = AppConstants.setTitle
        navigationController?.navigationBar.backgroundColor = ColorsConstants.tabBarColor
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 1)
        navigationController?.navigationBar.layer.shadowColor = UIColor.black.cgColor
        navigationController?.navigationBar.layer.shadowRadius = 0
        navigationController?.navigationBar.layer.shadowOpacity = 0.3
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
        sender.text = setMainModel.addCharacterToSet(sender.tag, sender.text ?? "")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(textField.text ?? "")
    }
    
    func buttonFirstTapped() {
            
    }
    
    func buttonSecondTapped() {
        
    }
    
    func buttonThirdTapped() {
        
    }
}
