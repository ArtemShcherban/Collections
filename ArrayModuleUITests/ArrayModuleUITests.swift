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
    
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
