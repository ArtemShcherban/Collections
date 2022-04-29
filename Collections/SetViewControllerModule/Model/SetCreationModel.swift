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
    private lazy var controlString: String = ""
    private lazy var controlStringOne: String = ""
    private lazy var controlStringTwo: String = ""
    private lazy var checkedString: String = ""
    private lazy var letters = Array(SetConstants.aphabetLetters)
    
    func inputHandling(_ textFieldTag: Int, _ string: String) -> String {
        if !string.isEmpty {
            checkedString = checkingForLetters(string.lowercased())
            if checkedString == string.lowercased() {
                updateSetOfCharacters(textFieldTag)
                return checkedString
            }
            return checkedString
        }
        checkedString = string
        updateSetOfCharacters(textFieldTag)
        return checkedString
}

private func checkingForLetters(_ string: String) -> String {
    
    if letters.contains(string.last ?? " ") {
        return string
    } else {
        var updatedString = string
        updatedString.removeLast()
        return updatedString
    }
}

private func updateSetOfCharacters(_ textFieldTag: Int) {
    switch textFieldTag {
    case 1:
        controlString = controlStringOne
        setUpdate(&firstSetOfCharacters)
        controlStringOne = checkedString
    case 2:
        controlString = controlStringTwo
        setUpdate(&secondSetOfCharacters)
        controlStringTwo = checkedString
    default:
        break
    }
}

private func setUpdate(_ set: inout Set<Character>) {
    if checkedString.count == 0 {
        set = []
    } else if controlString.count <= checkedString.count {
        set.insert((checkedString.last ?? Character("")))
        
    } else if checkedString.count != 0 && !checkedString.contains(controlString.last ?? Character("")) {
        set.remove(controlString.last ?? Character(""))
    }
}
}
