//
//  DictionaryMainModel.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import Foundation

class DictionaryMainModel {
    
    struct Contact {
        var name: String
        var phoneNumber: String
    }
    
    var contactsArray: [Contact] = []
    var contactsDictionary: [String: String] = [:]
    
    func createContactsArray() {
        let startTime = DispatchTime.now()
        for index in 0...9999999 {
          let contact = Contact.init(name: "Name\\\(index)", phoneNumber: "\(index)")
            contactsArray.append(contact)
        }
        let endTime = DispatchTime.now()
        let nanoTime = (endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        let timeInterval = String(Double(nanoTime) / 1_000_000_000) + " s."
        print(timeInterval)
    }
    
    func createContactDictionary() {
        let startTime = DispatchTime.now()
        for index in 0...9999999 {
            contactsDictionary.updateValue("\(index)", forKey: "Name_\(index)")
        }
        let endTime = DispatchTime.now()
        let nanoTime = (endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        let timeInterval = String(Double(nanoTime) / 1_000_000_000) + " s."
        print(timeInterval)
    }
}
