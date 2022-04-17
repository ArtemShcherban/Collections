//
//  DictionaryMainView.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import UIKit

class DictionaryMainView: UIView {
    
    lazy var button: UIButton = {
       let tempButton = UIButton()
        
        tempButton.backgroundColor = .red
     return tempButton
    }()
    
    func createMainView() {
        backgroundColor = .purple
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                                     button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     button.heightAnchor.constraint(equalToConstant: 35),
                                     button.widthAnchor.constraint(equalToConstant: 100)])
    }
}
