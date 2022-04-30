//
//  CollectionView.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import UIKit

class CollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewLayout())
        collectionViewLayout = createCompositionalLayout()
        collectionViewConfigure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        collectionViewConfigure()
    }
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1 / 6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func createCompositionalLayoutWithThreeDifferentCellSizes() -> UICollectionViewCompositionalLayout {
        let itemContentInsent = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1.0))
        let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
        smallItem.contentInsets = itemContentInsent
        
        let mediumItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2),
                                                    heightDimension: .fractionalHeight(1.0))
        let mediumItem = NSCollectionLayoutItem(layoutSize: mediumItemSize)
        mediumItem.contentInsets = itemContentInsent
        
        let bigItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(2/3), heightDimension: .fractionalHeight(1))
        let bigItem = NSCollectionLayoutItem(layoutSize: bigItemSize)
        bigItem.contentInsets = itemContentInsent
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(1/6))
        let smallItemsGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: smallItem, count: 3)
        let smallAndBigItemsGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [smallItem, bigItem])
        let mediumItemsGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: mediumItem, count: 2)
        let bigAndSmallItemsGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [bigItem, smallItem])
        
        let nestedGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: nestedGroupSize,
                                                           subitems: [smallAndBigItemsGroup, smallItemsGroup, mediumItemsGroup,
                                                                      smallItemsGroup, bigAndSmallItemsGroup])
        
        let section = NSCollectionLayoutSection(group: nestedGroup)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func createCompositionalLayoutWithTwoDifferentCellSizes() -> UICollectionViewCompositionalLayout {
        let itemContentInsent = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        let smallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4),
                                                   heightDimension: .fractionalHeight(1.0))
        let smallItem = NSCollectionLayoutItem(layoutSize: smallItemSize)
        smallItem.contentInsets = itemContentInsent
        
        let bigItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.6),
                                                 heightDimension: .fractionalHeight(1))
        let bigItem = NSCollectionLayoutItem(layoutSize: bigItemSize)
        bigItem.contentInsets = itemContentInsent
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(1/6))
        
        let smallAndBigItemsGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                       subitems: [smallItem, bigItem])
        let bigAndSmallItemsGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                                       subitems: [bigItem, smallItem])
        
        let nestedGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                     heightDimension: .fractionalHeight(1))
        let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: nestedGroupSize,
                                                           subitems: [smallAndBigItemsGroup, bigAndSmallItemsGroup])
        
        let section = NSCollectionLayoutSection(group: nestedGroup)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func collectionViewConfigure() {
        backgroundColor = ColorsConstants.mainColor
        register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
    }
}
