//
//  SetWorkingModel.swift
//  Collections
//
//  Created by Artem Shcherban on 15.04.2022.
//

import Foundation

final class SetWorkingModel: SetCreationModel {
    
    func searchMatchingCharacters() -> String {
        let matchingCharacters = firstSetOfCharacters.intersection(secondSetOfCharacters)
        let components = matchingCharacters.map { character in String(character) }
        return components.joined(separator: "")
    }
    
    func searchNotMatchingCharacters() -> String {
        let notMatchingCharacters = firstSetOfCharacters.symmetricDifference(secondSetOfCharacters)
        let components = notMatchingCharacters.map { character in String(character) }
        return components.joined(separator: "")
    }
    
    func searchUniqueCharacters() -> String {
        let uniqueCharacters = firstSetOfCharacters.subtracting(secondSetOfCharacters)
        let components = uniqueCharacters.map { character in String(character) }
        return components.joined(separator: "")
    }
}
