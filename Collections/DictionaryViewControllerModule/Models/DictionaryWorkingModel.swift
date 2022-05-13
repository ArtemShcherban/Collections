//
//  DictionaryWorkingModel.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import Foundation

final class DictionaryWorkingModel: DictionaryMainModel {
    
    static let shared = DictionaryWorkingModel()
    
    private(set) var resultOfSearch: Any?
    private lazy var titleFirstPart = ""
    
    func numberOfRows() -> Int {
        return DictionaryConstants.tasksTitles.count
    }
    
    func receiveTitleFoCell(_ indexPath: IndexPath) -> String {
        DictionaryConstants.tasksTitles[indexPath.row]
    }
    
    func startTaskAt(_ indexPath: IndexPath, with elementsToSearch: [String]) {
        switch indexPath.row {
        case 0, 2, 4:
            findElementInArray(indexPath.row, from: elementsToSearch)
        case 1, 3, 5:
            findElementInDictionary(indexPath.row, from: elementsToSearch)
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
        return titleFirstPart + timeMeasureModel.timeInterval + titleSecondPart
    }
    
    private func findElementInArray(_ index: Int, from elementsToSearch: [String] ) {
        timeMeasureModel.timeMeasureRunningCode {
            resultOfSearch = contactsArray.first { $0.name == elementsToSearch[index] }
        }
        titleFirstPart = DictionaryConstants.fistPartOfTitle[index]
    }
    
    private func findElementInDictionary(_ index: Int, from elementsToSearch: [String] ) {
        timeMeasureModel.timeMeasureRunningCode {
            resultOfSearch = contactsDictionary.first { $0.key == elementsToSearch[index] }
        }
        titleFirstPart = DictionaryConstants.fistPartOfTitle[index]
    }
}
