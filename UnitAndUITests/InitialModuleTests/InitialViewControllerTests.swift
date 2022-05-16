//
//  InitialModuleTests.swift
//  InitialModuleTests
//
//  Created by Artem Shcherban on 26.04.2022.
//

import XCTest
@testable import Collections

final class InitialViewControllerTests: XCTestCase {

    private var sut: InitialMainViewController!
    private var navigation: UINavigationController!
   
    override func setUpWithError() throws {
        try super.setUpWithError()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: InitialMainViewController.reuseIdentifier) as? InitialMainViewController
        navigation = UINavigationController(rootViewController: sut)
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_numberOfRows() {
        XCTAssertEqual(numberOfRows(in: sut.initialTableView), 3)
    }
    
    func test_tappingArrayCell_shouldPushedArrayViewController() {
        let expectedTitle = "Array:"
        
        sut.performSegue(withIdentifier: "Array", sender: nil)
        executeRunLoop()
        if navigation.viewControllers.count != 2 {
            XCTFail("Should be two viewControllers in navigation stack")
        }
        let pushedVC = navigation.viewControllers.last
        guard let arrayVC = pushedVC as? ArrayViewController else {
            XCTFail("Expected ArrayViewController," + "but was \(String(describing: pushedVC))")
            return
        }
        arrayVC.createNavigationBar(for: ArrayViewController.self)
        guard let title = arrayVC.title?.prefix(6) else {
            XCTFail("No title found")
            return
        }

        XCTAssertEqual(String(title), expectedTitle)
    }

    func test_tappingSetCell_shouldPushedSetViewController() {
        let expectedTitle = "Set:"
        
        didSelectRow(in: sut.initialTableView, row: 1)
        executeRunLoop()
        if navigation.viewControllers.count != 2 {
            XCTFail("Should be two viewControllers in navigation stack")
        }
        
        let pushedVC = navigation.viewControllers.last
        guard let setVC = pushedVC as? SetViewController else {
            XCTFail("Expected SetViewController," + "but was \(String(describing: pushedVC))")
            return
        }

        setVC.createNavigationBar(for: SetViewController.self)
        guard let title = setVC.title?.prefix(4) else {
            XCTFail("No title found")
            return
        }
        
        XCTAssertEqual(String(title), expectedTitle)

    }
    
    func test_tappingDictionaryCell_shouldPushedDictionaryViewController() {
        let expectedTitle = "Dictionary:"

        didSelectRow(in: sut.initialTableView, row: 2)
        executeRunLoop()
        if navigation.viewControllers.count != 2 {
            XCTFail("Should be two viewControllers in navigation stack")
        }
        let pushedVC = navigation.viewControllers.last
        guard let dictionaryVC = pushedVC as? DictionaryViewController else {
            XCTFail("Expected DictionaryViewController," + "but was \(String(describing: pushedVC))")
            return
        }
        dictionaryVC.createNavigationBar(for: DictionaryViewController.self)
        guard let title = dictionaryVC.title?.prefix(11) else {
            XCTFail("No title found")
            return
        }
        
        XCTAssertEqual(String(title), expectedTitle)
    }
    
    func test_decimalFormat_returnsFormattedString() {
        XCTAssertEqual(1000000.decimalFormat(), "1 000 000")
        XCTAssertEqual(5000.decimalFormat(), "5 000")
        XCTAssertEqual(100.decimalFormat(), "100")
        XCTAssertEqual(1.decimalFormat(), "1")
    }
}
