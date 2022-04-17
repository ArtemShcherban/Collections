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
        return view
    }()
    
    override func loadView() {
        view = dictionaryMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dictionaryMainView?.createMainView()
        dictionaryMainView?.button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Dictionary"
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    @objc func buttonPressed() {
        print("Button pressed")
        dictionaryMainModel.createContactDictionary()
      }
}
