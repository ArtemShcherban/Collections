//
//  DictionaryWorkingModel.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import Foundation

class DictionaryWorkingModel: DictionaryMainModel {

    private var resultOfSearch: Any?
    private lazy var titleFirstPart = ""
    
    func numberOfRows() -> Int {
        return DictionaryConstants.dictionaryTasksTitles.count
    }
    
    func receiveTitleFoCell(_ indexPath: IndexPath) -> String {
        DictionaryConstants.dictionaryTasksTitles[indexPath.row]
    }

    func startTaskAt(_ indexPath: IndexPath) {
        switch indexPath.row {
        case 0, 2, 4:
            findElementInArray(indexPath.row)
        case 1, 3, 5:
            findElementInDictionary(indexPath.row)
        default :
            break
        }
    }
    
   func createNewTitle() -> String {
        var titleSecondPart = " Result number: 0"
        if resultOfSearch != nil {
            titleSecondPart = " Result number: 1"
        }
        resultOfSearch = nil
       return titleFirstPart + timeInterval + titleSecondPart
    }
    
    private func findElementInArray(_ index: Int) {
        startTime = DispatchTime.now()
        resultOfSearch = contactsArray.first { $0.name == DictionaryConstants.elementsForSearch[index] }
        endTime = DispatchTime.now()
        titleFirstPart = DictionaryConstants.fistPartOfTitle[index]
    }
    
    private func findElementInDictionary(_ index: Int) {
        startTime = DispatchTime.now()
        resultOfSearch = contactsDictionary.first { $0.key ==  DictionaryConstants.elementsForSearch[index] }
        endTime = DispatchTime.now()
        titleFirstPart = DictionaryConstants.fistPartOfTitle[index]
    }
}
