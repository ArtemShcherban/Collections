//
//  ArrayMainModel.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import Foundation

final class ArrayMainModel: TimeCalculation {
    
    var startTime = DispatchTime(uptimeNanoseconds: 0)
    var endTime = DispatchTime(uptimeNanoseconds: 0)
    private(set) lazy var integers: [Int] = []
    private(set) lazy var tempIntegers: [Int] = []
    private lazy var tasksTitle = ArrayConstants.taskstitles
    private lazy var methods = [insertBeginingOneByOne, insertBeginingOnce,
                                insertMiddleOneByOne, insertMiddleOnce,
                                insertEndOneByOne, insertEndOnce,
                                removeEndOneByOne, removeEndOnce,
                                removeMiddleOneByOne, removeMiddleOnce,
                                removeBeginingOneByOne, removeBeginingOnce]
    
    func createArray(with maximumElements: Int) {
        startTime = DispatchTime.now()
        integers = Array(0..<maximumElements)
        endTime = DispatchTime.now()
    }
    
    func numberOfRow() -> Int {
        tasksTitle.count
    }
    
    func receiveTitle(_ indexPath: IndexPath) -> String {
        tasksTitle[indexPath.row]
    }
    
    func startTask(_ indexPath: IndexPath, _ numberOfElements: Int = AppConstants.numberOfElements) {
        let method = methods[indexPath.row]
        method(numberOfElements)
    }
    
    private func insertBeginingOneByOne(_ numberOfElements: Int) {
        tempIntegers = integers
        startTime = DispatchTime.now()
        for element in 1...numberOfElements {
            tempIntegers.insert(element, at: 0)
        }
        endTime = DispatchTime.now()
    }
    
    private func insertBeginingOnce(_ numberOfElements: Int) {
        tempIntegers = integers
        startTime = DispatchTime.now()
        tempIntegers.insert(contentsOf: Array(1...numberOfElements), at: 0)
        endTime = DispatchTime.now()
    }
    
    private func insertMiddleOneByOne(_ numberOfElements: Int) {
        tempIntegers = integers
        let index = tempIntegers.count / 2
        startTime = DispatchTime.now()
        for element in 1...numberOfElements {
            tempIntegers.insert(element, at: (index + element))
        }
        endTime = DispatchTime.now()
    }
    
    private func insertMiddleOnce(_ numberOfElements: Int) {
        tempIntegers = integers
        startTime = DispatchTime.now()
        tempIntegers.insert(contentsOf: Array(1...numberOfElements), at: (tempIntegers.count / 2 + 1))
        endTime = DispatchTime.now()
    }
    
    private func insertEndOneByOne(_ numberOfElements: Int) {
        tempIntegers = integers
        startTime = DispatchTime.now()
        for element in 1...numberOfElements {
            tempIntegers.append(element)
        }
        endTime = DispatchTime.now()
    }
    
    private func insertEndOnce(_ numberOfElements: Int) {
        tempIntegers = integers
        startTime = DispatchTime.now()
        tempIntegers.append(contentsOf: Array(1...numberOfElements))
        endTime = DispatchTime.now()
    }
    
    private func removeEndOneByOne(_ numberOfElements: Int) {
        tempIntegers = integers
        startTime = DispatchTime.now()
        for _ in 1...numberOfElements {
            tempIntegers.removeLast(1)
        }
        endTime = DispatchTime.now()
    }
    
    private func removeEndOnce(_ numberOfElements: Int) {
        tempIntegers = integers
        startTime = DispatchTime.now()
        tempIntegers.removeLast(numberOfElements)
        endTime = DispatchTime.now()
    }
    
    private func removeMiddleOneByOne(_ numberOfElements: Int) {
        tempIntegers = integers
        startTime = DispatchTime.now()
        for _ in 1...numberOfElements {
            tempIntegers.remove(at: Int(tempIntegers.count / 2))
        }
        endTime = DispatchTime.now()
    }
    
    private func removeMiddleOnce(_ numberOfElements: Int) {
        tempIntegers = integers
        startTime = DispatchTime.now()
        tempIntegers.removeSubrange((tempIntegers.count / 2 - numberOfElements / 2)..<(tempIntegers.count / 2 + numberOfElements / 2))
        endTime = DispatchTime.now()
    }
    
    private func removeBeginingOneByOne(_ numberOfElements: Int) {
        tempIntegers = integers
        startTime = DispatchTime.now()
        for _ in 1...numberOfElements {
            tempIntegers.remove(at: 0)
        }
        endTime = DispatchTime.now()
    }
    
    private func removeBeginingOnce(_ numberOfElements: Int) {
        tempIntegers = integers
        startTime = DispatchTime.now()
        tempIntegers.removeSubrange(0..<numberOfElements)
        endTime = DispatchTime.now()
    }
}
