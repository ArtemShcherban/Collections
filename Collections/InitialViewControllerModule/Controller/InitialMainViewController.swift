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
        navigationBarConfigure()
    }
    
    private func navigationBarConfigure() {
        title = "Collections"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension InitialMainViewController: InitialMainViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return initialMainModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
                                                        InitialTableViewCell.reuseIdentifier) as? InitialTableViewCell else { return UITableViewCell() }
        let cellTitle = initialMainModel.reciveTitle(indexPath)
        cell.configure(title: cellTitle)
        
        return cell
    }
}
