//
//  NavigationBarExtension.swift
//  Collections
//
//  Created by Artem Shcherban on 21.04.2022.
//

import UIKit

extension UIViewController {
    
    func createNavigationBar(for viewController: UIViewController.Type) {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = ColorsConstants.mainColor
        appearance.shadowColor = .black
        navigationItem.scrollEdgeAppearance = appearance
        
        if viewController == InitialMainViewController.self {
            navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            navigationController?.navigationBar.prefersLargeTitles = false
        }
        title = createTitle(for: viewController)
    }
    
    private func createTitle(for viewController: UIViewController.Type) -> String {
        var title = String()
        guard let navigationTitle = navigationItem.title else { return String() }
        
        if viewController == InitialMainViewController.self {
            title = AppConstants.mainTitle
            
        } else if viewController == ArrayViewController.self {
            title = AppConstants.titles[0] + navigationTitle
            
        } else if viewController == SetViewController.self {
            title = AppConstants.titles[1] + navigationTitle
            
        } else if viewController == DictionaryViewController.self {
            title = AppConstants.titles[2] + navigationTitle
        }
        return title
    }
}
