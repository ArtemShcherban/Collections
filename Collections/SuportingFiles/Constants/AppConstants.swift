//
//  AppConstants.swift
//  Collections
//
//  Created by Artem Shcherban on 07.04.2022.
//

import Foundation
import UIKit

struct AppConstants {
    static let mainTitle = "Collections"
    static let initialTableViewTitles = ["Array", "Set", "Dictionary"]
    static let rightArrowImage = UIImage(named: "fi-rr-angle-small-right")
    static let bigButtonTitle = "Create Int array with 10_000_000 elements"
    static let buttonsTitles = ["Array", "Dictionary"]
    static let numberOfElements = 500
    
    static let taskstitles = ["Insert \(numberOfElements) elements at the begining of the array one-by-one",
                              "Insert \(numberOfElements) elements at the begining of the array",
                              "Insert \(numberOfElements) elements at the middle of the array one-by-one",
                              "Insert \(numberOfElements) elements at the middle of the array",
                              "Insert \(numberOfElements) elements at the end of the array one-by-one",
                              "Insert \(numberOfElements) elements at the end of the array",
                              "Remove \(numberOfElements) elements at the end of the array one-by-one",
                              "Remove \(numberOfElements) elements at the end of the array",
                              "Remove \(numberOfElements) elements at the middle of the array one-by-one",
                              "Remove \(numberOfElements) elements at the middle of the array",
                              "Remove \(numberOfElements) elements at the begining of the array one-by-one",
                              "Remove \(numberOfElements) elements at the begining of the array"]
    
    static let dictionaryTasksTitles = ["Find the first element in array",
                                        "Find the first element in dictionary",
                                        "Find the last element in array",
                                        "Find the last element in dictionary",
                                        "Search for non-existing element in array",
                                        "Search for non-existing element in dictionary"]
}
