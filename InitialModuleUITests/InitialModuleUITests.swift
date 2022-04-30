//
//  InitialModuleUITests.swift
//  InitialModuleUITests
//
//  Created by Artem Shcherban on 27.04.2022.
//

import XCTest

final class InitialModuleUITests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }
    
        func test_tappedArrayCell_shouldPushArrayViewController() {
            let arrayCell = app.tables.cells.staticTexts["Array"]
            let bigButton = app.buttons["bigButton"]
    
            arrayCell.tap()
    
            XCTAssertTrue(bigButton.exists)
        }
}
