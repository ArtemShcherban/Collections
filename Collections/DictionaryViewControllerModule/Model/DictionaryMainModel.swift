//
//  DictionaryMainModel.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import Foundation

class DictionaryMainModel: TimeCalculation {
    
    lazy var startTime = DispatchTime(uptimeNanoseconds: 0)
    lazy var endTime = DispatchTime(uptimeNanoseconds: 0)
    
    struct Contact {
        var name: String
        var phoneNumber: String
    }
    
    lazy var contact: Contact! = nil
    
    var contactsArray: [Contact] = []
    var contactsDictionary: [String: String] = [:]
    
    func createContactsArray(with maximumElements: Int) {
        startTime = DispatchTime.now()
        for index in 0..<maximumElements {
            contact = Contact(name: "Name\(index)", phoneNumber: "\(index)")
            contactsArray.append(contact)
        }
        endTime = DispatchTime.now()
    }
    
    func createContactsDictionary(with maximumElements: Int) {
        startTime = DispatchTime.now()
        for index in 0..<maximumElements {
            contactsDictionary.updateValue("\(index)", forKey: "Name\(index)")
        }
        endTime = DispatchTime.now()
    }
}
