//
//  StringExtension.swift
//  Collections
//
//  Created by Artem Shcherban on 23.04.2022.
//

import Foundation

extension Int {
    func decimalFormat() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = " "
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}
