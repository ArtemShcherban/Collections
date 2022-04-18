//
//  InitialMainView.swift
//  Collections
//
//  Created by Artem Shcherban on 07.04.2022.
//

import UIKit

final class InitialMainView: UIView {
    
    private lazy var initialTableView = UITableView()
    
    weak var delegate: InitialMainViewDelegate?
    
    func createInitialMainView() {
        backgroundColor = ColorsConstants.tabBarColor
        addSubview(initialTableView)
        setInitialTableViewConstraints()
        initialTableViewConfigure()
    }
    
    private func initialTableViewConfigure() {
        initialTableView.delegate = delegate
        initialTableView.dataSource = delegate
        initialTableView.register(InitialTableViewCell.self, forCellReuseIdentifier: InitialTableViewCell.reuseIdentifier)
    }
    
    private func setInitialTableViewConstraints() {
        initialTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([initialTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     initialTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     initialTableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                                     initialTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}

protocol InitialMainViewDelegate: UITableViewDelegate, UITableViewDataSource {
    
}
