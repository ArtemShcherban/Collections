//
//  InitialModuleUITests.swift
//  InitialModuleUITests
//
//  Created by Artem Shcherban on 27.04.2022.
//

import XCTest

@testable import Collections
final class InitialModuleUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }
    
    func test_tappedSetCell_shouldPushSetViewController() {
        let upperTextField = app.textFields["upperTextField"]
        let bottomTextField = app.textFields["bottomTextField"]
        
        app.tables.cells.staticTexts["Set"].tap()
        
        XCTAssertTrue(upperTextField.exists)
        XCTAssertTrue(bottomTextField.exists)
    }
}
