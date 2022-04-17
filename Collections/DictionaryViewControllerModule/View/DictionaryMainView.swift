//
//  DictionaryMainView.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import UIKit

class DictionaryMainView: UIView {

    lazy var arrayButton = BigButton()
    lazy var dictionaryButton = BigButton()
    private lazy var buttons = [arrayButton, dictionaryButton]

    lazy var collectionView = CollectionView()
    
    weak var delegate: DictionaryMainViewDelegate?
    
    func createMainView() {
        backgroundColor = .purple
        self.addSubview(arrayButton)
        self.addSubview(dictionaryButton)
        addSubview(collectionView)
        setButtonTitle()
        addButtonTarget()
        collectionViewConfigure()
        setButtonsConstraints()
        setCollectionViewConstraints()
    }
    
    func setButtonTitle() {
        arrayButton.setTitle(AppConstants.buttonsTitles[0], for: .normal)
        dictionaryButton.setTitle(AppConstants.buttonsTitles[1], for: .normal)
    }
    
    func addButtonTarget() {
        arrayButton.addTarget(delegate, action: #selector(delegate?.arrayButtonPressed), for: .touchUpInside)
        dictionaryButton.addTarget(delegate, action: #selector(delegate?.dictionaryButtonPressed), for: .touchUpInside)
    }
    
    func collectionViewConfigure() {
        collectionView.delegate = delegate
        collectionView.dataSource = delegate
    }
    
    func setButtonsConstraints() {
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
    
    func setCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     collectionView.topAnchor.constraint(equalTo: arrayButton.bottomAnchor, constant: 1),
                                     collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)])
    }
}

@objc protocol DictionaryMainViewDelegate: UICollectionViewDelegate, UICollectionViewDataSource {
    func arrayButtonPressed()
    func dictionaryButtonPressed()
}
