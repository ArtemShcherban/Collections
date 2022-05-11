//
//  TimeCalculating.swift
//  Collections
//
//  Created by Artem Shcherban on 18.04.2022.
//

import Foundation

protocol TimeCalculating {
    
    var startTime: DispatchTime { get }
    
    var endTime: DispatchTime { get }
}

extension TimeCalculating {
    
    var timeInterval: String {
        let nanoTime = (endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        return String(format: "%.3f", Double(nanoTime) / 1_000_000) + " ms."
    }
}
