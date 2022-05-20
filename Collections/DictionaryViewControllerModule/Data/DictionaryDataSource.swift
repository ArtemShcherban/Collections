//
//  DictionaryDataSource.swift
//  Collections
//
//  Created by Artem Shcherban on 13.05.2022.
//

import UIKit

final class DictionaryDataSource: NSObject, UICollectionViewDataSource {
    
    private lazy var dictionaryWorkingModel = DictionaryWorkingModel.shared
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dictionaryWorkingModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier,
                                                            for: indexPath) as? CollectionViewCell else { fatalError(ErrorConstants.cannotCreateCell.rawValue)}
        
        let cellTitle = dictionaryWorkingModel.receiveTitleFoCell(indexPath)
        cell.configure(cellTitle)
        return cell
    }
}
