//
//  ViewController.swift
//  Collections
//
//  Created by Artem Shcherban on 07.04.2022.
//

import UIKit

final class InitialMainViewController: UIViewController {
    
    private lazy var initialMainModel = InitialMainModel()
    
    private lazy var initialMainView: InitialMainView? = {
        let view = InitialMainView()
        view.delegate = self
        return view
    }()
    
    override func loadView() {
        view = initialMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialMainView?.createInitialMainView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationBarConfigure()
    }
    
    private func navigationBarConfigure() {
        title = AppConstants.mainTitle
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.scrollEdgeAppearance = initialMainView?.createNavigationBarAppearance()
    }
}

extension InitialMainViewController: InitialMainViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return initialMainModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
                                                        InitialTableViewCell.reuseIdentifier) as? InitialTableViewCell else { return UITableViewCell() }
        let cellTitle = initialMainModel.receiveTitle(indexPath)
        cell.configure(title: cellTitle)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var viewcontroller: UIViewController!
        
        switch indexPath.row {
        case 0:
            viewcontroller = ArrayViewController()
        case 1:
            viewcontroller = SetViewController()
        case 2:
            viewcontroller = DictionaryViewController()
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: false)
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
}
