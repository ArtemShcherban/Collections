//
//  DictionaryViewController.swift
//  Collections
//
//  Created by Artem Shcherban on 08.04.2022.
//

import UIKit

class DictionaryViewController: UIViewController {
    
    private lazy var dictionaryMainModel = DictionaryMainModel()
    
    private lazy var dictionaryMainView: DictionaryMainView? = {
        let view = DictionaryMainView()
        view.delegate = self
        return view
    }()
    
    override func loadView() {
        view = dictionaryMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dictionaryMainView?.createMainView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Dictionary"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

extension DictionaryViewController: DictionaryMainViewDelegate {
    func arrayButtonPressed() {
        dictionaryMainView?.arrayButton.update()
        dictionaryMainView?.arrayButton.startActivityIndicator()
        DispatchQueue.main.async {
            self.dictionaryMainModel.createContactsArray()
            self.dictionaryMainView?.arrayButton.stopActivityIndicator()
            self.dictionaryMainView?.arrayButton.setTitle(AppConstants.buttonsTitles[0], for: .normal)
        }
    }
    
    func dictionaryButtonPressed() {
        dictionaryMainView?.dictionaryButton.update()
        dictionaryMainView?.dictionaryButton.startActivityIndicator()
        DispatchQueue.main.async {
            self.dictionaryMainModel.createContactsDictionary()
            self.dictionaryMainView?.dictionaryButton.stopActivityIndicator()
            self.dictionaryMainView?.dictionaryButton.setTitle(AppConstants.buttonsTitles[1], for: .normal)
        }
    }
}
