//
//  ArrayMainModel.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import Foundation

final class ArrayMainModel {
    private lazy var integers: [Int] = []
    private lazy var tasksTitle = AppConstants.taskstitles
    private var startTime: DispatchTime!
    private var endTime: DispatchTime!
    var timeInterval: String!
    private lazy var methods = [insertBeginingOneByOne, insertBeginingOnce,
                                insertMiddleOneByOne, insertMiddleOnce,
                                insertEndOneByOne, insertEndOnce,
                                removeEndOneByOne, removeEndOnce,
                                removeMiddleOneByOne, removeMiddleOnce,
                                removeBeginingOneByOne, removeBeginingOnce]
    
    func createArray() {
        startTime = DispatchTime.now()
        integers = Array(0...9999999)
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
    
    func timeСalculation() {
        let nanoTime = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds
        timeInterval = String(Double(nanoTime) / 1_000_000_000) + " s."
        print(timeInterval ?? "")
    }
    
    private func insertBeginingOneByOne() {
        startTime = DispatchTime.now()
        for element in 1...AppConstants.numberOfElements {
            integers.insert(element, at: 0)
            print(element)
        }
        endTime = DispatchTime.now()
        print(integers.count)
    }
    
    private func insertBeginingOnce() {
        startTime = DispatchTime.now()
        integers.insert(contentsOf: Array(1...AppConstants.numberOfElements), at: 0)
        endTime = DispatchTime.now()
        
        print(integers.count)
    }
    
    private func insertMiddleOneByOne() {
        startTime = DispatchTime.now()
        for element in 1...AppConstants.numberOfElements {
            integers.insert(element, at: (integers.count / 2 + 1))
            print(element)
        }
        endTime = DispatchTime.now()
        print(integers.count)
    }
    
    private func insertMiddleOnce() {
        startTime = DispatchTime.now()
        integers.insert(contentsOf: Array(1...AppConstants.numberOfElements), at: (integers.count / 2 + 1))
        endTime = DispatchTime.now()
        
        print(integers.count)
    }
    
    private func insertEndOneByOne() {
        startTime = DispatchTime.now()
        for element in 1...AppConstants.numberOfElements {
            integers.append(element)
            print(element)
        }
        endTime = DispatchTime.now()
        print(integers.count)
    }
    
    private func insertEndOnce() {
        startTime = DispatchTime.now()
        integers.append(contentsOf: Array(1...AppConstants.numberOfElements))
        endTime = DispatchTime.now()
        
        print(integers.count)
    }
    
    private func removeEndOneByOne() {
        startTime = DispatchTime.now()
        for element in 1...AppConstants.numberOfElements {
            integers.removeLast(1)
            print(element)
        }
        endTime = DispatchTime.now()
        print(integers.count)
    }
    
    private func removeEndOnce() {
        startTime = DispatchTime.now()
        integers.removeLast(AppConstants.numberOfElements)
        endTime = DispatchTime.now()
        print(integers.count)
    }
    
    private func removeMiddleOneByOne() {
        startTime = DispatchTime.now()
        for element in 1...AppConstants.numberOfElements {
            integers.remove(at: Int(integers.count / 2))
            print(element)
        }
        endTime = DispatchTime.now()
        print(integers.count)
    }
    
    private func removeMiddleOnce() {
        startTime = DispatchTime.now()
        integers.removeSubrange((integers.count / 2 - AppConstants.numberOfElements / 2)..<(integers.count / 2 + AppConstants.numberOfElements / 2) )
        endTime = DispatchTime.now()
        print(integers.count)
    }
    
    private func removeBeginingOneByOne() {
        startTime = DispatchTime.now()
        for element in 1...AppConstants.numberOfElements {
            integers.remove(at: 0)
            print(element)
        }
        endTime = DispatchTime.now()
        print(integers.count)
    }
    
    private func removeBeginingOnce() {
        startTime = DispatchTime.now()
        integers.removeSubrange(0..<AppConstants.numberOfElements)
        endTime = DispatchTime.now()
        print(integers.count)
    }
}
