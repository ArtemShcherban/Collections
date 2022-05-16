//
//  InitialModuleUITests.swift
//  InitialModuleUITests
//
//  Created by Artem Shcherban on 27.04.2022.
//

import XCTest

final class InitialModuleUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private lazy var arrayButton = app.buttons["arrayButton"]
    private lazy var dictionaryButton = app.buttons["dictionaryButton"]
    private lazy var cell = app.cells.staticTexts["Dictionary"]
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }
    
    func test_tappedDictionaryCell_shouldPushDictionaryViewController() {
        cell.tap()
        
        XCTAssertTrue(arrayButton.exists)
        XCTAssertTrue(dictionaryButton.exists)
    }
}
