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
    
    func test_collectionViewDelegate_notNil() {
        XCTAssertNotNil(collectionView.delegate)
    }

    func test_collectionViewDataSource_notNil() {
        XCTAssertNotNil(collectionView.dataSource)
    }

    func test_numberOfRows_shouldBeSix() {
        XCTAssertEqual(numberOfRows(in: collectionView), 6)
    }

    func test_cellForItemAt_withRow3_shouldSetCorrectTitle() {
        let expectedTitle = DictionaryConstants.tasksTitles[3]

        let cell = cellForItem(in: collectionView, row: 3)

        XCTAssertEqual(cell?.titleTextLabel.text, expectedTitle)
    }

    func test_cellForItemAt_withRow9_shouldSetCorrectTitle() {
        let expectedTitle = DictionaryConstants.tasksTitles[5]

        let cell = cellForItem(in: collectionView, row: 5)

        XCTAssertEqual(cell?.titleTextLabel.text, expectedTitle)
    }

//    func test_didSelectItemAt_withRow6_shouldChangeBackgroundColor() {
//        let expectedColor = ColorsConstants.newColor
//        let cell = cellForItem(in: collectionView, row: 6)
//        didSelectItem(in: collectionView, row: 6)
//
//        XCTAssertEqual(cell?.backgroundColor, expectedColor)
//    }

    func cellForItem(in collectionView: CollectionView, row: Int, section: Int = 0) -> CollectionViewCell? {
        let cell = collectionView.dataSource?.collectionView(collectionView, cellForItemAt: IndexPath(row: row, section: section))
        return cell as? CollectionViewCell
    }

    func numberOfRows(in collectionView: CollectionView, section: Int = 0) -> Int? {
        collectionView.dataSource?.collectionView(collectionView, numberOfItemsInSection: section)
    }

    func didSelectItem(in collectionView: CollectionView, row: Int, section: Int = 0) {
        collectionView.delegate?.collectionView?(collectionView, didSelectItemAt: IndexPath(row: row, section: section))
    }
}
