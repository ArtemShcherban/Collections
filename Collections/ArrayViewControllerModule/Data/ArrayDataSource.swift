//
//  ArrayDataSource.swift
//  Collections
//
//  Created by Artem Shcherban on 11.05.2022.
//

import UIKit

class ArrayDataSource: NSObject, UICollectionViewDataSource {
    
    private(set) lazy var arrayMainModel = ArrayMainModel.shared
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayMainModel.numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier,
                                                            for: indexPath) as? CollectionViewCell
        else { fatalError(ErrorConstants.cannotCreateCell.rawValue) }
        
        let celltitle = arrayMainModel.receiveTitle(indexPath)
        cell.configure(celltitle)
        
        return cell
    }
}
