//
//  DictionaryMainView.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import UIKit

final class DictionaryMainView: UIView {
    
    lazy var arrayButton = BigButton()
    lazy var dictionaryButton = BigButton()
    private lazy var buttons = [arrayButton, dictionaryButton]
    
    private lazy var collectionView = CollectionView()
    
    weak var delegate: DictionaryMainViewDelegate?
    
    func createMainView() {
        backgroundColor = ColorsConstants.mainColor
        addSubview(arrayButton)
        addSubview(dictionaryButton)
        addSubview(collectionView)
        buttonsConfigure()
        addButtonTarget()
        collectionViewConfigure()
        setButtonsConstraints()
        setCollectionViewConstraints()
    }
    
    private func buttonsConfigure() {
        for (index, button) in buttons.enumerated() {
            button.setTitle(DictionaryConstants.buttonsTitles[index], for: .normal)
            button.backgroundColor = .white
        }
    }
    
    private func addButtonTarget() {
        arrayButton.addTarget(delegate, action: #selector(delegate?.arrayButtonPressed), for: .touchUpInside)
        dictionaryButton.addTarget(delegate, action: #selector(delegate?.dictionaryButtonPressed), for: .touchUpInside)
    }
    
    private func collectionViewConfigure() {
        collectionView.delegate = delegate
        collectionView.dataSource = delegate
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
    }
    
    private func setButtonsConstraints() {
        var horizontalInterval: CGFloat = 0
        buttons.forEach { button in
            button.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([button.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                                         constant: horizontalInterval),
                                         button.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                                         button.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 1),
                                         button.heightAnchor.constraint(equalToConstant: 100)])
            
            horizontalInterval += (UIScreen.main.bounds.width / 2) + 1
        }
    }
    
    private func setCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     collectionView.topAnchor.constraint(equalTo: arrayButton.bottomAnchor, constant: 1),
                                     collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)])
    }
}

@objc protocol DictionaryMainViewDelegate: UICollectionViewDelegate, UICollectionViewDataSource {
    func arrayButtonPressed()
    func dictionaryButtonPressed()
}
