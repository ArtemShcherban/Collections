//
//  ArrayMainModel.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import Foundation

final class ArrayMainModel {
    static let shared = ArrayMainModel()
    
    lazy var timeMeasureModel = TimeMeasureModel.shared
    private(set) lazy var integers: [Int] = []
    private(set) lazy var tempIntegers: [Int] = []
    var numberOfRows: Int { ArrayConstants.taskTitles.count }
    private lazy var methods = [insertBeginingOneByOne, insertBeginingOnce,
                                insertMiddleOneByOne, insertMiddleOnce,
                                insertEndOneByOne, insertEndOnce,
                                removeEndOneByOne, removeEndOnce,
                                removeMiddleOneByOne, removeMiddleOnce,
                                removeBeginingOneByOne, removeBeginingOnce]
    
    func createArray(with maximumElements: Int) {
        timeMeasureModel.timeMeasureRunningCode {
            integers = Array(0..<maximumElements)
        }
    }
    
    func receiveTitle(_ indexPath: IndexPath) -> String {
        ArrayConstants.taskTitles[indexPath.row]
    }
    
    func startTask(_ indexPath: IndexPath, _ numberOfElements: Int = AppConstants.numberOfElements) {
        let method = methods[indexPath.row]
        timeMeasureModel.timeMeasureRunningCode {
            tempIntegers = integers
            method(numberOfElements)
        }
    }
    
    private func insertBeginingOneByOne(_ numberOfElements: Int) {
        for element in 1...numberOfElements {
            tempIntegers.insert(element, at: 0)
        }
    }
    
    private func insertBeginingOnce(_ numberOfElements: Int) {
        tempIntegers.insert(contentsOf: Array(1...numberOfElements), at: 0)
    }
    
    private func insertMiddleOneByOne(_ numberOfElements: Int) {
        let index = tempIntegers.count / 2
        for element in 1...numberOfElements {
            tempIntegers.insert(element, at: (index + element))
        }
    }
    
    private func insertMiddleOnce(_ numberOfElements: Int) {
        tempIntegers.insert(contentsOf: Array(1...numberOfElements), at: (tempIntegers.count / 2 + 1))
    }
    
    private func insertEndOneByOne(_ numberOfElements: Int) {
        for element in 1...numberOfElements {
            tempIntegers.append(element)
        }
    }
    
    private func insertEndOnce(_ numberOfElements: Int) {
        tempIntegers.append(contentsOf: Array(1...numberOfElements))
    }
    
    private func removeEndOneByOne(_ numberOfElements: Int) {
        for _ in 1...numberOfElements {
            tempIntegers.removeLast(1)
        }
    }
    
    private func removeEndOnce(_ numberOfElements: Int) {
        tempIntegers.removeLast(numberOfElements)
    }
    
    private func removeMiddleOneByOne(_ numberOfElements: Int) {
        for _ in 1...numberOfElements {
            tempIntegers.remove(at: Int(tempIntegers.count / 2))
        }
    }
    
    private func removeMiddleOnce(_ numberOfElements: Int) {
        tempIntegers.removeSubrange((tempIntegers.count / 2 - numberOfElements / 2)..<(tempIntegers.count / 2 + numberOfElements / 2))
    }
    
    private func removeBeginingOneByOne(_ numberOfElements: Int) {
        for _ in 1...numberOfElements {
            tempIntegers.remove(at: 0)
        }
    }
    
    private func removeBeginingOnce(_ numberOfElements: Int) {
        tempIntegers.removeSubrange(0..<numberOfElements)
    }
}
