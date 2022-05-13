//
//  TimeMeasureModel.swift
//  Collections
//
//  Created by Artem Shcherban on 13.05.2022.
//

import Foundation

class TimeMeasureModel: TimeCalculating {
    
    var startTime = DispatchTime(uptimeNanoseconds: 0)
    var endTime = DispatchTime(uptimeNanoseconds: 0)
    
    static let shared = TimeMeasureModel()
    
    func timeMeasureRunningCode(operationBlok: () -> Void) {
        startTime = DispatchTime.now()
        operationBlok()
        endTime = DispatchTime.now()
    }
}
