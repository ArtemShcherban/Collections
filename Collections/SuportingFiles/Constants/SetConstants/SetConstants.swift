//
//  SetConstants.swift
//  Collections
//
//  Created by Artem Shcherban on 29.04.2022.
//

import UIKit

enum SetConstants {
    
    static let aphabetLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    
    static let setButtonsTitles = ["All matching letters",
                                   "All characters that do not match",
                                   "All unique characters from the first text field that do not match in the text fields"]
    
    static let upperTextFieldID = "upperTextField"
    static let bottomTextFieldID = "bottomTextField"
    static let buttonFirstID = "buttonFirst"
    static let buttonSecondID = "buttonSecond"
    static let buttonThirdID = "buttonThird"
    static let textLabelFirstID = "textLabelFirst"
    static let textLabelSecondID = "textLabelSecond"
    static let textLabelThirdID = "textLabelThird"
    
    static let textViewHeight: CGFloat = 36
    
    enum Sizes {
        static let leftIndent: CGFloat = 16
        static let rightIndent: CGFloat = -16
    }
}
