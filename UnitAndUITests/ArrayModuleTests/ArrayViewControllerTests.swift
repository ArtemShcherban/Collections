//
//  ArrayViewControllerTests.swift
//  ArrayModuleTests
//
//  Created by Artem Shcherban on 06.05.2022.
//

import XCTest
@testable import Collections

final class ArrayViewControllerTests: XCTestCase {
    private var sut: ArrayViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ArrayViewController()
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test_tappingArrayButton_ShouldCreateArray() {
        let globalDefault = SyncQueue.global
        let globalBackground = SyncQueue.background
        sut.globalQueue = globalDefault
        sut.mainQuaue = globalBackground
        
        sut.bigButtonTapped()
        
        XCTAssertEqual(sut.arrayMainModel.integers.count, AppConstants.maximumElements)
    }
}
