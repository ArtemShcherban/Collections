//
//  CollectionView.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import UIKit

class CollectionView: UICollectionView {
    var compositionalLayout = UICollectionViewLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: compositionalLayout)
        createCompositionalLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createCompositionalLayout()
    }
    
    func createCompositionalLayout() {
        backgroundColor = .cyan
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        compositionalLayout = UICollectionViewCompositionalLayout(section: section)
        
    }
}
