//
//  DictionaryWorkingModel.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import Foundation

class DictionaryWorkingModel: DictionaryMainModel {
      
    func numberOfRows() -> Int {
        return AppConstants.dictionaryTasksTitles.count
    }
    
    func receiveTitleFoCell(_ indexPath: IndexPath) -> String {
        AppConstants.dictionaryTasksTitles[indexPath.row]
    }
    
}
