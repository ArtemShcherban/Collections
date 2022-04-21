//
//  SetViewController.swift
//  Collections
//
//  Created by Artem Shcherban on 08.04.2022.
//

import UIKit

class SetViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createNavigationBar(for: SetViewController.self)
    }
}
