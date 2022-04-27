//
//  InitialModuleTests.swift
//  InitialModuleTests
//
//  Created by Artem Shcherban on 26.04.2022.
//

import XCTest
@testable import Collections

class InitialViewControllerTests: XCTestCase {

    private var sut: InitialMainViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: InitialMainViewController.reuseIdentifier) as? InitialMainViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_numberOfRows() {
        XCTAssertEqual(numberOfRows(in: sut.initialTableView), 3)
    }

    func testTappedSetCellShouldPushedSetViewController() {
        let navigation = UINavigationController(rootViewController: sut)

        didSelectRow(in: sut.initialTableView, row: 1)
        executeRunLoop()
        XCTAssertEqual(navigation.viewControllers.count, 2, "navigation stack")
        
        let pushedVC = navigation.viewControllers.last
        guard let setVC = pushedVC as? SetViewController else {
            XCTFail("Expected SetViewController," + "but was \(String(describing: pushedVC))")
            return
        }
//        XCTAssertEqual(setVC.view.backgroundColor, UIColor.magenta)
    }
    
    func testTappedDictionaryCellShouldPushedDictionaryViewController() {
        let navigation = UINavigationController(rootViewController: sut)

        didSelectRow(in: sut.initialTableView, row: 2)
        executeRunLoop()
        let pushedVC = navigation.viewControllers.last
        guard let dictionaryVC = pushedVC as? DictionaryViewController else {
            XCTFail("Expected DictionaryViewController," + "but was \(String(describing: pushedVC))")
            return
        }
        XCTAssertEqual(dictionaryVC.view.backgroundColor, UIColor.purple)
    }
}
