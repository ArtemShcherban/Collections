//
//  DictionaryCollectionViewTests.swift
//  DictionaryModuleTests
//
//  Created by Artem Shcherban on 03.05.2022.
//

import XCTest
@testable import Collections

final class DictionaryCollectionViewTests: XCTestCase {
    
    private var sut: DictionaryViewController!
    private var collectionView: CollectionView!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DictionaryViewController()
        sut.loadViewIfNeeded()
        collectionView = sut.dictionaryMainView?.collectionView
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_numberOfRows_shouldBeSix() {
        XCTAssertEqual(numberOfItems(in: collectionView), 6)
    }
    
    func test_cellForItemAt_withRow3_shouldSetCorrectTitle() {
        let expectedTitle = DictionaryConstants.tasksTitles[3]
        
        let cell = cellForItem(in: collectionView, item: 3)
        
        XCTAssertEqual(cell?.titleTextLabel.text, expectedTitle)
    }
    
    func test_cellForItemAt_withRow9_shouldSetCorrectTitle() {
        let expectedTitle = DictionaryConstants.tasksTitles[5]
        
        let cell = cellForItem(in: collectionView, item: 5)
        
        XCTAssertEqual(cell?.titleTextLabel.text, expectedTitle)
    }
    
    func test_tappingCell_withRow3_shouldChangeBackgroundColor() {
        let global = SyncQueue.global
        let background = SyncQueue.background
        sut.globalQueue = global
        sut.mainQueue = background
        let expectedColor = ColorsConstants.whiteColor
        
        guard let cell = cellForItem(in: collectionView, item: 3) else { return XCTFail("Cannot create a cell") }
        sut.didSelect(cell, at: IndexPath(item: 3, section: 0))
        
        XCTAssertEqual(cell.backgroundColor, expectedColor)
    }
}
