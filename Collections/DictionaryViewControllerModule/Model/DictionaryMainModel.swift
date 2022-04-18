//
//  DictionaryMainModel.swift
//  Collections
//
//  Created by Artem Shcherban on 17.04.2022.
//

import Foundation

class DictionaryMainModel: TimeCalculateProtocol {
    
    var startTime = DispatchTime(uptimeNanoseconds: 0)
    var endTime = DispatchTime(uptimeNanoseconds: 0)
    
    struct Contact {
        var name: String
        var phoneNumber: String
    }
    
    var contactsArray: [Contact] = []
    var contactsDictionary: [String: String] = [:]
    
    func createContactsArray() {
        startTime = DispatchTime.now()
        for index in 0...9_999_999 {
          let contact = Contact.init(name: "Name\(index)", phoneNumber: "\(index)")
            contactsArray.append(contact)
        }
        endTime = DispatchTime.now()
    }
    
    func createContactsDictionary() {
        startTime = DispatchTime.now()
        for index in 0...9_999_999 {
            contactsDictionary.updateValue("\(index)", forKey: "Name\(index)")
        }
        endTime = DispatchTime.now()
    }
}

protocol TimeCalculateProtocol {
    var startTime: DispatchTime { get }
    var endTime: DispatchTime { get }
}

extension TimeCalculateProtocol {
    
    var timeInterval: String {
        let nanoTime = (endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        return String(format: "%.3f", Double(nanoTime) / 1_000_000) + " ms."
    }

}
