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
    static let titles = ["Array", "Set", "Dictionary"]
    static let rightArrowImage = UIImage(named: "fi-rr-angle-small-right")
    static let maximumElements = 10_000_000
    static let bigButtonTitle = "Create Int array with \(maximumElements.decimalFormat()) elements"
    static let buttonsTitles = ["Array", "Dictionary"]
    static let numberOfElements = 1000
    static let textViewHeight: CGFloat = 36
    
    static let setButtonsTitles = ["All matching letters",
                                   "All characters that do not match",
                                   "All unique characters from the first text field that do not match in the text fields"]
    
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
    
    static let fistPartOfTitle = ["First element search time: ", "First element search time: ",
                                  "Last element search time: ", "Last element search time: ",
                                  "Non-existing element search time: ", "Non-existing element search time: "]
    
    static let elementsForSearch = ["Name0", "Name0", "Name9999999", "Name9999999", "Name99fdd999", "Name99fdd999"]
    static let aphabetLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    static let upperTextFieldID = "upperTextField"
    static let bottomTextFieldID = "bottomTextField"
    static let buttonFirstID = "buttonFirst"
    static let buttonSecondID = "buttonSecond"
    static let buttonThirdID = "buttonThird"
    static let textLabelFirstID = "textLabelFirst"
    static let textLabelSecondID = "textLabelSecond"
    static let textLabelThirdID = "textLabelThird"
}
