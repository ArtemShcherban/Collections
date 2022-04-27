//
//  SetModelsTestsExtensions.swift
//  SetModuleTests
//
//  Created by Artem Shcherban on 27.04.2022.
//

import UIKit
@testable import Collections

extension SetModelsTests {
    
    func inputString(in textField: Int, _ inputedString: String) -> String {
        var expectedString = ""
        inputedString.forEach { character in
            expectedString += String(character)
            expectedString = modelUnderTest.inputHandling(textField, expectedString)
        }
        return expectedString
    }
    
    func deleteString(in textField: Int, _ deletingString: String) {
        var bufferString = deletingString
        while bufferString.count != 0 {
            bufferString.removeLast()
            _ = modelUnderTest.inputHandling(textField, bufferString)
        }
    }
    
    func createSets() {
        _ = inputString(in: upperTextField, firstInputedString)
        _ = inputString(in: bottomTextField, secondInputedString)
    }
}
