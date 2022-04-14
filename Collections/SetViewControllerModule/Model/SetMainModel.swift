//
//  SetMainViewModel.swift
//  Collections
//
//  Created by Artem Shcherban on 14.04.2022.
//

import Foundation

class SetMainModel {
    
    var firstSetOfCharacters: Set<Character> = []
    var secondSetOfCharacters: Set<Character> = []
    lazy var checkStringOne: String = ""
 
    func addCharacterToSet(_ number: Int, _ string: String) -> String {
       var newString = string
        if !string.isEmpty &&
            firstSetOfCharacters.contains(string.last ?? Character("")) && checkStringOne.count < string.count {
            newString.removeLast()
            return newString
        }
        
        switch number {
        case 1:
            updateFirstSet(string.lowercased())
            print("firstSetOfCharacters is \(firstSetOfCharacters)")
        case 2:
//            secondSetOfCharacters.insert(Character(character.lowercased()))
            print("secondSetOfCharacters is \(secondSetOfCharacters)")
        default:
            break
        }
        return newString
    }
    
    func updateFirstSet(_ string: String) {
        if checkStringOne.count <= string.count {
            firstSetOfCharacters.insert((string.lowercased().last ?? Character("")))
            checkStringOne = string
        } else if string.count != 0 {
            firstSetOfCharacters.remove(checkStringOne.last ?? Character(""))
            checkStringOne = string
        } else {
            firstSetOfCharacters = []
        }
        
    }
}
