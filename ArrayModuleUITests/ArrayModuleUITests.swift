//
//  ArrayModuleUITests.swift
//  ArrayModuleUITests
//
//  Created by Artem Shcherban on 29.04.2022.
//

import XCTest

final class ArrayModuleUITests: XCTestCase {
    
    private var app: XCUIApplication!
    private lazy var cell = app.cells.staticTexts["Array"]
    private lazy var bigButton = app.buttons["bigButton"]
    private lazy var collectionView = app.collectionViews["collectionView"]
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
        cell.tap()
        continueAfterFailure = false
        
    }
    
    func test_tappingBigButton_collectionViewAppear() {
        self.bigButton.tap()
        
        XCTAssertTrue(collectionView.waitForExistence(timeout: 2))
    }
}
