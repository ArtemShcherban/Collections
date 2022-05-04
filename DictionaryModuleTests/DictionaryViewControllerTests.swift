//
//  DictionaryViewControllerTests.swift
//  DictionaryModuleTests
//
//  Created by Artem Shcherban on 02.05.2022.
//

import XCTest
@testable import Collections

final class DictionaryViewControllerTests: XCTestCase {
    
    private var sut: DictionaryViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DictionaryViewController()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_tappingArrayButton_shouldCreateArray() {
        let global = SyncQueue.global
        let background = SyncQueue.background
        sut.globalQueue = global
        sut.mainQueue = background
        
        sut.arrayButtonPressed()
        
        XCTAssertEqual(sut.dictionaryWorkingModel.contactsArray.count, AppConstants.maximumElements)
    }
    
    func test_tappingDictionaryButton_shouldCreateDictionarry() {
        let global = SyncQueue.global
        let background = SyncQueue.background
        sut.globalQueue = global
        sut.mainQueue = background
        
        sut.dictionaryButtonPressed()
        
        XCTAssertEqual(sut.dictionaryWorkingModel.contactsDictionary.count, AppConstants.maximumElements)
        
    }
}
