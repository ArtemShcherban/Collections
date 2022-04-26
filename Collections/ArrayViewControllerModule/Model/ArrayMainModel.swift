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
    private lazy var integers: [Int] = []
    private lazy var tasksTitle = AppConstants.taskstitles
    private lazy var methods = [insertBeginingOneByOne, insertBeginingOnce,
                                insertMiddleOneByOne, insertMiddleOnce,
                                insertEndOneByOne, insertEndOnce,
                                removeEndOneByOne, removeEndOnce,
                                removeMiddleOneByOne, removeMiddleOnce,
                                removeBeginingOneByOne, removeBeginingOnce]
    
    func createArray() {
        startTime = DispatchTime.now()
        integers = Array(0...9_999_999)
        endTime = DispatchTime.now()
    }
    
    func numberOfRow() -> Int {
        tasksTitle.count
    }
    
    func receiveTitle(_ indexPath: IndexPath) -> String {
        tasksTitle[indexPath.row]
    }
    
    func startTask(_ indexPath: IndexPath) {
        let method = methods[indexPath.row]
        method()
    }
    
    private func insertBeginingOneByOne() {
        var tempIntegers = integers
        startTime = DispatchTime.now()
        for element in 1...AppConstants.numberOfElements {
            tempIntegers.insert(element, at: 0)
        }
        endTime = DispatchTime.now()
    }
    
    private func insertBeginingOnce() {
        var tempIntegers = integers
        startTime = DispatchTime.now()
        tempIntegers.insert(contentsOf: Array(1...AppConstants.numberOfElements), at: 0)
        endTime = DispatchTime.now()
    }
    
    private func insertMiddleOneByOne() {
        var tempIntegers = integers
        startTime = DispatchTime.now()
        for element in 1...AppConstants.numberOfElements {
            tempIntegers.insert(element, at: (tempIntegers.count / 2 + 1))
        }
        endTime = DispatchTime.now()
    }
    
    private func insertMiddleOnce() {
        var tempIntegers = integers
        startTime = DispatchTime.now()
        tempIntegers.insert(contentsOf: Array(1...AppConstants.numberOfElements), at: (tempIntegers.count / 2 + 1))
        endTime = DispatchTime.now()
    }
    
    private func insertEndOneByOne() {
        var tempIntegers = integers
        startTime = DispatchTime.now()
        for element in 1...AppConstants.numberOfElements {
            tempIntegers.append(element)
        }
        endTime = DispatchTime.now()
    }
    
    private func insertEndOnce() {
        var tempIntegers = integers
        startTime = DispatchTime.now()
        tempIntegers.append(contentsOf: Array(1...AppConstants.numberOfElements))
        endTime = DispatchTime.now()
    }
    
    private func removeEndOneByOne() {
        var tempIntegers = integers
        startTime = DispatchTime.now()
        for _ in 1...AppConstants.numberOfElements {
            tempIntegers.removeLast(1)
        }
        endTime = DispatchTime.now()
    }
    
    private func removeEndOnce() {
        var tempIntegers = integers
        startTime = DispatchTime.now()
        tempIntegers.removeLast(AppConstants.numberOfElements)
        endTime = DispatchTime.now()
    }
    
    private func removeMiddleOneByOne() {
        var tempIntegers = integers
        startTime = DispatchTime.now()
        for _ in 1...AppConstants.numberOfElements {
            tempIntegers.remove(at: Int(tempIntegers.count / 2))
        }
        endTime = DispatchTime.now()
    }
    
    private func removeMiddleOnce() {
        var tempIntegers = integers
        startTime = DispatchTime.now()
        tempIntegers.removeSubrange((tempIntegers.count / 2 - AppConstants.numberOfElements / 2)..<(tempIntegers.count / 2 + AppConstants.numberOfElements / 2) )
        endTime = DispatchTime.now()
    }
    
    private func removeBeginingOneByOne() {
        var tempIntegers = integers
        startTime = DispatchTime.now()
        for _ in 1...AppConstants.numberOfElements {
            tempIntegers.remove(at: 0)
        }
        endTime = DispatchTime.now()
    }
    
    private func removeBeginingOnce() {
        var tempIntegers = integers
        startTime = DispatchTime.now()
        tempIntegers.removeSubrange(0..<AppConstants.numberOfElements)
        endTime = DispatchTime.now()
    }
}
