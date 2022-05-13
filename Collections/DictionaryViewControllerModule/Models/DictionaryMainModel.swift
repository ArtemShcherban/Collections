//
//  DictionaryMainModel.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import Foundation

class DictionaryMainModel {
    
    lazy var timeMeasureModel = TimeMeasureModel.shared
    
    private(set) var contact: Contact!
    
    private(set) var contactsArray: [Contact] = []
    private(set) var contactsDictionary: [String: String] = [:]
    
    func createContactsArray(with maximumElements: Int) {
        timeMeasureModel.timeMeasureRunningCode {
            for index in 0..<maximumElements {
                contact = Contact(name: "Name\(index)", phoneNumber: "\(index)")
                contactsArray.append(contact)
            }
        }
    }
    
    func createContactsDictionary(with maximumElements: Int) {
        timeMeasureModel.timeMeasureRunningCode {
            for index in 0..<maximumElements {
                contactsDictionary.updateValue("\(index)", forKey: "Name\(index)")
            }
        }
    }
}
