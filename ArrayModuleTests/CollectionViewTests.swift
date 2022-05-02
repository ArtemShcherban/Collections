//
//  CollectionViewTests.swift
//  ArrayModuleTests
//
//  Created by Artem Shcherban on 02.05.2022.
//

import XCTest
@testable import Collections

final class CollectionViewTests: XCTestCase {
    private var sut: ArrayViewController!
    private var collectionView: CollectionView!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ArrayViewController()
        sut.loadViewIfNeeded()
        sut.arrayMainView?.addCollectionView()
        collectionView = sut.arrayMainView?.collectionView
        
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

    func test_numberOfRows_shouldBeTwelve() {
        XCTAssertEqual(numberOfRows(in: collectionView), 12)
    }

    func test_cellForItemAt_withRow3_shouldSetCorrectTitle() {
        let expectedTitle = ArrayConstants.taskstitles[3]

        let cell = cellForItem(in: collectionView, row: 3)

        XCTAssertEqual(cell?.titleTextLabel.text, expectedTitle)
    }

    func test_cellForItemAt_withRow9_shouldSetCorrectTitle() {
        let expectedTitle = ArrayConstants.taskstitles[9]

        let cell = cellForItem(in: collectionView, row: 9)

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
