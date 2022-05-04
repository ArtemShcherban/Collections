//
//  DictionaryModuleTests.swift
//  DictionaryModuleTests
//
//  Created by Artem Shcherban on 02.05.2022.
//

import XCTest
@testable import Collections

final class DictionaryModelsTests: XCTestCase {
    
    private var modelUnderTest: DictionaryWorkingModel!
    private let elementsForSearch = ["Name0", "Name0", "Name999", "Name999", "Name99fdd999", "Name99fdd999"]
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        modelUnderTest = DictionaryWorkingModel()
        
    }
    
    override func tearDownWithError() throws {
        modelUnderTest = nil
        try super.tearDownWithError()
    }
    
    func test_createContactsArray_shouldCreateContactsArray() {
        
        if modelUnderTest.contactsArray.count != 0 {
            XCTFail("The contactsArray should be empty")
        }
        modelUnderTest.createContactsArray(with: 1000)
        
        XCTAssertEqual(modelUnderTest.contactsArray.count, 1000)
    }
    
    func test_createContactsDictionary_shouldCreateContactsDictionary() {
        
        if modelUnderTest.contactsDictionary.count != 0 {
            XCTFail("The contactsDictionary should be empty")
        }
        modelUnderTest.createContactsDictionary(with: 1000)
        
        XCTAssertEqual(modelUnderTest.contactsDictionary.count, 1000)
    }
    
    func test_findElementInArray_first_shouldReturnNotNil() {
        let indexPath = IndexPath(row: 0, section: 0)
        modelUnderTest.createContactsArray(with: 1000)
        modelUnderTest.startTaskAt(indexPath, with: elementsForSearch)
        
        XCTAssertNotNil(modelUnderTest.resultOfSearch)
    }
    
    func test_test_findElementInDictionary_first_shouldReturnNotNil() {
        let indexPath = IndexPath(row: 1, section: 0)
        modelUnderTest.createContactsDictionary(with: 1000)
        modelUnderTest.startTaskAt(indexPath, with: elementsForSearch)
        
        XCTAssertNotNil(modelUnderTest.resultOfSearch)
    }
    
    func test_findElementInArray_last_shouldReturnNotNil() {
        let indexPath = IndexPath(row: 2, section: 0)
        modelUnderTest.createContactsArray(with: 1000)
        modelUnderTest.startTaskAt(indexPath, with: elementsForSearch)
        
        XCTAssertNotNil(modelUnderTest.resultOfSearch)
    }
    
    func test_findElementInDictionary_last_shouldReturnNotNil() {
        let indexPath = IndexPath(row: 3, section: 0)
        modelUnderTest.createContactsDictionary(with: 1000)
        modelUnderTest.startTaskAt(indexPath, with: elementsForSearch)
        
        XCTAssertNotNil(modelUnderTest.resultOfSearch)
    }
    
    func test_findElementInArray_notExistElement_shouldReturnNil() {
        let indexPath = IndexPath(row: 4, section: 0)
        modelUnderTest.createContactsArray(with: 1000)
        modelUnderTest.startTaskAt(indexPath, with: elementsForSearch)
        
        XCTAssertNil(modelUnderTest.resultOfSearch)
    }
    
    func test_findElementInDictionary_notExistElement_shouldReturnNil() {
        let indexPath = IndexPath(row: 5, section: 0)
        modelUnderTest.createContactsDictionary(with: 1000)
        modelUnderTest.startTaskAt(indexPath, with: elementsForSearch)
        
        XCTAssertNil(modelUnderTest.resultOfSearch)
    }
    
    func testContactsArrayCreationTime() {
        measure {
            modelUnderTest.createContactsArray(with: 10000000)
        }
    }
    
    func testContactsDictionaryCreationTime() {
        measure {
            modelUnderTest.createContactsDictionary(with: 10000000)
        }
    }
}
