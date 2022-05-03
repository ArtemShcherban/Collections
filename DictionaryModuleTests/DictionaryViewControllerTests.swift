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

        sut.arrayButtonPressed()
        let expectation = XCTestExpectation()
        DispatchQueue.main.async {
            XCTAssertEqual(self.sut.dictionaryWorkingModel.contactsArray.count, AppConstants.maximumElements)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
}
