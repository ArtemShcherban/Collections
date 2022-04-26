//
//  ArrayMainView.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import UIKit

final class ArrayMainView: UIView {
    
    weak var delegate: ArrayMainViewDelegate?
    
    lazy var bigButton: BigButton = {
        let tempBigButton = BigButton()
        tempBigButton.addTarget(delegate, action: #selector(delegate?.bigButtonTapped), for: .touchUpInside)
        return tempBigButton
    }()
    
    private lazy var collectionView = CollectionView()
    
    private lazy var bottomView: UIView = {
        let tempBottomView = UIView()
        tempBottomView.layer.borderWidth = 0.2
        tempBottomView.layer.borderColor = UIColor.black.cgColor
        return tempBottomView
    }()
    
    func createMainView() {
        backgroundColor = ColorsConstants.mainColor
        self.addSubview(bigButton)
        setBigButtonConstraints()
    }
    
    func addCollectionView() {
        self.addSubview(collectionView)
        self.addSubview(bottomView)
        collectionViewConfigure()
        setCollectionViewConstraints()
        setBottomViewConstraints()
    }

    private func collectionViewConfigure() {
        collectionView.delegate = delegate
        collectionView.dataSource = delegate
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
    }
    
    private  func setBigButtonConstraints() {
        bigButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([bigButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     bigButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     bigButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
                                     bigButton.heightAnchor.constraint(equalToConstant: 100)])
    }
    
    private func setCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
                                     collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
                                     collectionView.topAnchor.constraint(equalTo: bigButton.bottomAnchor, constant: 1),
                                     collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -1)])
    }
    
    private func setBottomViewConstraints() {
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                                     bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                                     bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                                     bottomView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)])
    }
}

@objc protocol ArrayMainViewDelegate: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func bigButtonTapped()
}
