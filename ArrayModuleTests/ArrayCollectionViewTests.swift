//
//  ArrayCollectionViewTests.swift
//  ArrayModuleTests
//
//  Created by Artem Shcherban on 02.05.2022.
//

import XCTest
@testable import Collections

final class ArrayCollectionViewTests: XCTestCase {
    private var sut: ArrayViewController!
    private var collectionView: CollectionView!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ArrayViewController()
        sut.loadViewIfNeeded()
        sut.arrayMainView.addCollectionView()
        collectionView = sut.arrayMainView.collectionView
        
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_numberOfRows_shouldBeTwelve() {
        XCTAssertEqual(numberOfItems(in: collectionView), 12)
    }
    
    func test_cellForItemAt_withRow3_shouldSetCorrectTitle() {
        let expectedTitle = ArrayConstants.taskstitles[3]
        
        let cell = cellForItem(in: collectionView, item: 3)
        
        XCTAssertEqual(cell?.titleTextLabel.text, expectedTitle)
    }
    
    func test_cellForItemAt_withRow9_shouldSetCorrectTitle() {
        let expectedTitle = ArrayConstants.taskstitles[9]
        
        let cell = cellForItem(in: collectionView, item: 9)
        
        XCTAssertEqual(cell?.titleTextLabel.text, expectedTitle)
    }
    
    func test_didSelect_cellWithRow5_shouldChangeBackgroundColor() {
        let globalDefault = SyncQueue.global
        let globalBackground = SyncQueue.background
        sut.globalQueue = globalDefault
        sut.mainQuaue = globalBackground
        let expectedColor = ColorsConstants.newColor

        guard let cell = cellForItem(in: collectionView, item: 5) else { XCTFail("Cannot create a cell")
            return
        }
        
        sut.didSelect(cell, at: IndexPath(row: 5, section: 0))
        
        XCTAssertEqual(cell.backgroundColor, expectedColor)
    }
}
