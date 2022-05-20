//
//  TimeMeasureModel.swift
//  Collections
//
//  Created by Artem Shcherban on 13.05.2022.
//

import Foundation

final class TimeMeasureModel {
    
    private var startTime: DispatchTime!
    private var endTime: DispatchTime!
    
    var timeInterval: String {
        let nanoTime = (endTime.uptimeNanoseconds - startTime.uptimeNanoseconds)
        return String(format: "%.3f", Double(nanoTime) / 1_000_000) + " ms."
    }
    
    static let shared = TimeMeasureModel()
    
    func timeMeasureRunningCode(operationBlok: () -> Void) {
        startTime = DispatchTime.now()
        operationBlok()
        endTime = DispatchTime.now()
    }
}
