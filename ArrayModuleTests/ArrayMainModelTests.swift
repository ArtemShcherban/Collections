//
//  ArrayModuleTests.swift
//  ArrayModuleTests
//
//  Created by Artem Shcherban on 23.04.2022.
//

import XCTest
@testable import Collections

class ArrayMainModelTests: XCTestCase {
    
    private var modelUnderTests: ArrayMainModel!
    private var indexPath: IndexPath!
    let numberOfElements = 100
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        modelUnderTests = ArrayMainModel()
        modelUnderTests.createArray(with: 1000)
        indexPath = IndexPath(row: 0, section: 0)
    }
    
    override func tearDownWithError() throws {
        modelUnderTests = nil
        try super.tearDownWithError()
    }
    
    func test_arrayCreation() {
        let maximumElements =  1100
        
        modelUnderTests.createArray(with: maximumElements)
        
        XCTAssertEqual(modelUnderTests.integers.last, 1099)
    }
    
    func test_insertBeginingOneByOne() {
        indexPath.row = 0
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers[99], 1)
        XCTAssertEqual(modelUnderTests.tempIntegers[100], 0)
    }
    
    func test_insertBeginingOnce() {
        indexPath.row = 1
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers[99], 100)
        XCTAssertEqual(modelUnderTests.tempIntegers[100], 0)
    }
    
    func test_insertMiddleOneByOne() {
        indexPath.row = 2
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers[501], 1)
        XCTAssertEqual(modelUnderTests.tempIntegers[600], 100)
    }
    
    func test_insertMiddleOnce() {
        indexPath.row = 3
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers[501], 1)
        XCTAssertEqual(modelUnderTests.tempIntegers[600], 100)
    }
    
    func test_insertEndOneByOne() {
        indexPath.row = 4
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers.last, 100)
        XCTAssertEqual(modelUnderTests.tempIntegers[1000], 1)
    }
    
    func test_insertEndOnce() {
        indexPath.row = 5
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers.last, 100)
        XCTAssertEqual(modelUnderTests.tempIntegers[1000], 1)
    }
    
    func test_removeEndOneByOne() {
        indexPath.row = 6
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers.last, 899)
    }
    
    func test_removeEndOnce() {
        indexPath.row = 7
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers.last, 899)
    }
    
    func test_removeMiddleOneByOne() {
        indexPath.row = 8
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers.last, 999)
        XCTAssertEqual(modelUnderTests.tempIntegers[500], 600)
        XCTAssertEqual(modelUnderTests.tempIntegers[450], 550)
        XCTAssertEqual(modelUnderTests.tempIntegers[400], 400)
    }
    
    func test_removeMiddleOnce() {
        indexPath.row = 9
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers.last, 999)
        XCTAssertEqual(modelUnderTests.tempIntegers[500], 600)
        XCTAssertEqual(modelUnderTests.tempIntegers[450], 550)
        XCTAssertEqual(modelUnderTests.tempIntegers[400], 400)
    }
    
    func test_removeBeginingOneByOne() {
        indexPath.row = 10
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers.first, 100)
        XCTAssertEqual(modelUnderTests.tempIntegers.last, 999)
    }
    
    func test_removeBeginingOnce() {
        indexPath.row = 11
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers.first, 100)
        XCTAssertEqual(modelUnderTests.tempIntegers.last, 999)
    }
    
    func test_arrayCreationTime() throws {
        self.measure {
            modelUnderTests.createArray(with: AppConstants.maximumElements)
        }
    }
}
