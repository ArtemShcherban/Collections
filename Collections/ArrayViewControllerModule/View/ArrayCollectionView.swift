//
//  ArrayCollectionView.swift
//  Collections
//
//  Created by Artem Shcherban on 08.04.2022.
//

import UIKit

final class ArrayCollectionView: UICollectionView {
    private var compositionLayout = UICollectionViewLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: compositionLayout)
        configureLayout()
        collectionViewConfigure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureLayout()
        collectionViewConfigure()
    }
    
   private func configureLayout() {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1 / 2), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1 / 6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        compositionLayout = UICollectionViewCompositionalLayout(section: section)
        
    }
    
   private func collectionViewConfigure() {
        collectionViewLayout = compositionLayout
        backgroundColor = ColorsConstants.tabBarColor
    }
}
