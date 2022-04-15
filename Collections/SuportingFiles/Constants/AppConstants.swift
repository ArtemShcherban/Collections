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
    static let setTitle = "Set"
    static let initialTableViewTitles = ["Array", "Set", "Dictionary"]
    static let rightArrowImage = UIImage(named: "fi-rr-angle-small-right")
    static let bigButtonTitle = "Create Int array with 10_000_000 elements"
    static let numberOfElements = 500
    static let textViewHeight: CGFloat = 36
    
    static let buttonsTitles = ["All matching letters",
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
    
}
