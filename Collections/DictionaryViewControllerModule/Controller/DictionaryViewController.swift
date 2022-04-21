//
//  DictionaryViewController.swift
//  Collections
//
//  Created by Artem Shcherban on 08.04.2022.
//

import UIKit

class DictionaryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createNavigationBar(for: DictionaryViewController.self)
    }
}
