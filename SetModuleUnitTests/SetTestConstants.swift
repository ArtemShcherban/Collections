//
//  SetTestConstants.swift
//  SetModuleUnitTests
//
//  Created by Artem Shcherban on 28.04.2022.
//

import Foundation

struct SetTestConstants {
    static let upperTextField = 1
    static let bottomTextField = 2
    static let firstInputedString = "5qw1er2tyui3op4"
    static let firstExpectedString = "qwertyuiop"
    static let secondInputedString = "7aw4dtg5h8ujko9"
    static let secondExpectedString = "awdtghujko"
    static let firstExpectedSet: Set<Character> = ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"]
    static let secondExpectedSet: Set<Character> = ["a", "w", "d", "t", "g", "h", "u", "j", "k", "o"]
    static let xctFailMessage = "The Set must contain elemnts"
}
