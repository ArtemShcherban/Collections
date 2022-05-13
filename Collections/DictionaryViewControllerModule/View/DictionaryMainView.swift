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
    
    private(set) lazy var collectionView = CollectionView()
    private lazy var collectionViewDataSource = DictionaryDataSource()
    weak var collectionViewDelegate: UICollectionViewDelegate?
    weak var delegate: DictionaryMainViewDelegate?
    
    func createMainView() {
        backgroundColor = ColorsConstants.mainColor
        addSubview(arrayButton)
        addSubview(dictionaryButton)
        addSubview(collectionView)
        buttonsConfigure()
        addButtonTarget()
        collectionViewConfigure()
        addAccessibilityIdentifiers()
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
        arrayButton.addTarget(self, action: #selector(arrayButtonAction), for: .touchUpInside)
        dictionaryButton.addTarget(self, action: #selector(dictionaryButtonAction), for: .touchUpInside)
    }
    
    @objc private func arrayButtonAction() {
        delegate?.arrayButtonPressed()
    }
    
    @objc private func dictionaryButtonAction() {
        delegate?.dictionaryButtonPressed()
    }
    
    private func addAccessibilityIdentifiers() {
        arrayButton.accessibilityIdentifier = DictionaryConstants.arrayButtonID
        dictionaryButton.accessibilityIdentifier = DictionaryConstants.dictionaryButtonID
    }
    
    private func collectionViewConfigure() {
        collectionView.delegate = collectionViewDelegate
        collectionView.dataSource = collectionViewDataSource
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

protocol DictionaryMainViewDelegate: AnyObject {
    func arrayButtonPressed()
    func dictionaryButtonPressed()
}
