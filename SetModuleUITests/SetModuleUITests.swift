//
//  SetModuleUITests.swift
//  SetModuleUITests
//
//  Created by Artem Shcherban on 27.04.2022.
//

import XCTest

final class SetModuleUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
        
    }
}
