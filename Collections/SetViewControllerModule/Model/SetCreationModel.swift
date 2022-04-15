//
//  SetMainViewModel.swift
//  Collections
//
//  Created by Artem Shcherban on 14.04.2022.
//

import Foundation

class SetCreationModel {
    
    private(set) lazy var firstSetOfCharacters: Set<Character> = []
    private(set) lazy var secondSetOfCharacters: Set<Character> = []
    private lazy var checkString: String = ""
    private lazy var checkStringOne: String = ""
    private lazy var checkStringTwo: String = ""
    private lazy var bufferString: String = ""
    
    func addCharacterToSet(_ number: Int, _ string: String) -> String {
        bufferString = string.lowercased()
        checkString = number == 1 ? checkStringOne : checkStringTwo
        let setOfCharacters = number == 1 ? firstSetOfCharacters : secondSetOfCharacters
        
        if checkString.count < string.count && setOfCharacters.contains(string.last ?? Character("")) {
            bufferString.removeLast()
            return bufferString
        }
        updateSetOfCharacters(number)
        return bufferString
    }
    
    private func updateSetOfCharacters(_ number: Int) {
        switch number {
        case 1:
            setUpdate(&firstSetOfCharacters)
            checkStringOne = bufferString
        case 2:
            setUpdate(&secondSetOfCharacters)
            checkStringTwo = bufferString
        default:
            break
        }
    }
    
    private func setUpdate(_ set: inout Set<Character>) {
        if checkString.count <= bufferString.count {
            set.insert((bufferString.last ?? Character("")))
            
        } else if bufferString.count != 0 {
            set.remove(checkString.last ?? Character(""))
            
        } else {
            set = []
        }
    }
}
