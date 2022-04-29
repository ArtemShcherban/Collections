//
//  SetModuleUITests.swift
//  SetModuleUITests
//
//  Created by Artem Shcherban on 29.04.2022.
//

import XCTest

final class SetModuleUITests: XCTestCase {

    private var app: XCUIApplication!
    private lazy var cell = app.cells.staticTexts["Set"]
    private lazy var upperTextField = app.textFields["upperTextField"]
    private lazy var bottomTextField = app.textFields["bottomTextField"]
    private lazy var buttonFirst = app.buttons["buttonFirst"]
    private lazy var buttonSecond = app.buttons["buttonSecond"]
    private lazy var buttonThird = app.buttons["buttonThird"]
    private lazy var textLabelFirst = app.staticTexts["textLabelFirst"]
    private lazy var textLabelSecond = app.staticTexts["textLabelSecond"]
    private lazy var textLabelThird = app.staticTexts["textLabelThird"]
      
    override func setUpWithError() throws {
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
        cell.tap()
        typeInTextInTextFields()
        continueAfterFailure = false
    }
    
    func typeInTextInTextFields() {
        upperTextField.tap()
        upperTextField.typeText(SetTestConstants.firstInputedString)
        bottomTextField.tap()
        bottomTextField.typeText(SetTestConstants.secondInputedString)
    }
 
    func test_tappingButtonFirst_textInTextLabelFirstAppear() {
   
        if textLabelFirst.label != "" { XCTFail("\(textLabelFirst) should be empty") }
        buttonFirst.tap()

        XCTAssertNotEqual(textLabelFirst.label, "")
    }
    
    func test_tappingButtonSecond_textInTextLabelSecondAppear() {
        
        if textLabelSecond.label != "" { XCTFail("\(textLabelSecond) should be empty") }
        buttonSecond.tap()

        XCTAssertNotEqual(textLabelSecond.label, "")
    }
    
    func test_tappingButtonThird_textInTextLabelThirdAppear() {
        
        if textLabelThird.label != "" { XCTFail("\(textLabelThird) should be empty") }
        buttonThird.tap()

        XCTAssertNotEqual(textLabelThird.label, "")
    }
}
