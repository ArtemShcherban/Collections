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
    
    func testArrayCreation() {
        let maximumElements =  1100
        
        modelUnderTests.createArray(with: maximumElements)
        
        XCTAssertEqual(modelUnderTests.integers.last, 1099)
    }
    
    func testInsertBeginingOneByOne() {
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers[99], 1)
        XCTAssertEqual(modelUnderTests.tempIntegers[100], 0)
    }
    
    func testInsertBeginingOnce() {
        indexPath.row = 1
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers[99], 100)
        XCTAssertEqual(modelUnderTests.tempIntegers[100], 0)
    }
    
    func testInsertMiddleOneByOne() {
        indexPath.row += 2
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers[501], 1)
        XCTAssertEqual(modelUnderTests.tempIntegers[600], 100)
    }
    
    func testInsertMiddleOnce() {
        indexPath.row = 3
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers[501], 1)
        XCTAssertEqual(modelUnderTests.tempIntegers[600], 100)
    }
    
    func testInsertEndOneByOne() {
        indexPath.row = 4
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers.last, 100)
        XCTAssertEqual(modelUnderTests.tempIntegers[1000], 1)
    }
    
    func testInsertEndOnce() {
        indexPath.row = 5
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers.last, 100)
        XCTAssertEqual(modelUnderTests.tempIntegers[1000], 1)
    }
    
    func testRemoveEndOneByOne() {
        indexPath.row = 6
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers.last, 899)
    }
    
    func testRemoveEndOnce() {
        indexPath.row = 7
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers.last, 899)
    }
    
    func testRemoveMiddleOneByOne() {
        indexPath.row = 8
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers.last, 999)
        XCTAssertEqual(modelUnderTests.tempIntegers[500], 600)
        XCTAssertEqual(modelUnderTests.tempIntegers[450], 550)
        XCTAssertEqual(modelUnderTests.tempIntegers[400], 400)
    }
    
    func testRemoveMiddleOnce() {
        indexPath.row = 9
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers.last, 999)
        XCTAssertEqual(modelUnderTests.tempIntegers[500], 600)
        XCTAssertEqual(modelUnderTests.tempIntegers[450], 550)
        XCTAssertEqual(modelUnderTests.tempIntegers[400], 400)
    }
    
    func testRemoveBeginingOneByOne() {
        indexPath.row = 10
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers.first, 100)
        XCTAssertEqual(modelUnderTests.tempIntegers.last, 999)
    }
    
    func testRemoveBeginingOnce() {
        indexPath.row = 11
        
        modelUnderTests.startTask(indexPath, numberOfElements)
        
        XCTAssertEqual(modelUnderTests.tempIntegers.first, 100)
        XCTAssertEqual(modelUnderTests.tempIntegers.last, 999)
    }
}
