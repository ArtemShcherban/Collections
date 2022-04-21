//
//  ArrayViewController.swift
//  Collections
//
//  Created by Artem Shcherban on 14.04.2022.
//

import UIKit

class ArrayViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createNavigationBar(for: ArrayViewController.self)
    }
}
