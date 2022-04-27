//
//  SetWorkingModelTests.swift
//  SetModuleTests
//
//  Created by Artem Shcherban on 27.04.2022.
//

import XCTest
@testable import Collections

final class SetModelsTests: XCTestCase {
    
    private(set) var modelUnderTest: SetWorkingModel!
    let upperTextField = SetTestConstants.upperTextField
    let bottomTextField = SetTestConstants.bottomTextField
    let firstInputedString = SetTestConstants.firstInputedString
    let firstExpectedString = SetTestConstants.firstExpectedString
    let secondInputedString = SetTestConstants.secondInputedString
    let secondExpectedString = SetTestConstants.secondExpectedSet
    let firstExpectedSet = SetTestConstants.firstExpectedSet
    let secondExpectedSet = SetTestConstants.secondExpectedSet
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        modelUnderTest = SetWorkingModel()
    }
    
    override func tearDownWithError() throws {
        modelUnderTest = nil
        try super.tearDownWithError()
    }
    
    func test_inputHandlingLettersAndNumbers_returnStringWithLettersOnly() {
        XCTAssertEqual(inputString(in: upperTextField, firstInputedString), firstExpectedString)
        XCTAssertEqual(inputString(in: bottomTextField, firstInputedString), firstExpectedString)
    }
    
    func test_inputHandlingLettersAndNumbers_createSetWithLettersOnly() {
        createSets()
        
        XCTAssertEqual(modelUnderTest.firstSetOfCharacters, firstExpectedSet)
        XCTAssertEqual(modelUnderTest.secondSetOfCharacters, secondExpectedSet)
    }
    
    func test_deletionOfStringInUpperTextField_returnEmptySet() {
        let stringInTextField = inputString(in: upperTextField, firstInputedString)
        if modelUnderTest.firstSetOfCharacters == [] {
            XCTFail(SetTestConstants.xctFailMessage)
        }
        deleteString(in: upperTextField, stringInTextField)
        
        XCTAssertEqual(modelUnderTest.firstSetOfCharacters, [])
    }
    
    func test_deletionOfStringInBottomTextField_returnEmptySet() {
        let stringInTextField = inputString(in: bottomTextField, secondInputedString)
        if modelUnderTest.secondSetOfCharacters == [] {
            XCTFail(SetTestConstants.xctFailMessage)
        }
        deleteString(in: bottomTextField, stringInTextField)
        
        XCTAssertEqual(modelUnderTest.secondSetOfCharacters, [])
    }
    
    func test_inputStrings_returnMatchingCharacters() {
        createSets()
        
        XCTAssertEqual(modelUnderTest.searchMatchingCharacters().count, 4)
    }
    
    func test_inputStrings_returnNotMatchingCharacters() {
        createSets()
        
        XCTAssertEqual(modelUnderTest.searchNotMatchingCharacters().count, 12)
    }
    
    func test_inputStrings_returnUniqueCharacters() {
        createSets()
        
        XCTAssertEqual(modelUnderTest.searchUniqueCharacters().count, 6)
    }
}
