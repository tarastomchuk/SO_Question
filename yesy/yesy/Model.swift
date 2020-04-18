//
//  Model.swift
//  yesy
//
//  Created by Taras Tomchuk on 18.04.2020.
//  Copyright © 2020 com.news.app. All rights reserved.
//

import UIKit

class LogSymptom: Codable {
    
    static var list = [LogSymptom]()
    
    var symptomId = String()
    var symptomName = String()
    var trackedInRow = Int()
    var severity = Int()
    var temperature = Float()
    var creationType = String()
    var timeStamp = TimeStamp()
    
    init(symptomId: String, symptomName: String, trackedInRow: Int, severity: Int, temperature: Float, creationType: String, timeStamp: TimeStamp) {
        self.symptomId = symptomId
        self.symptomName = symptomName
        self.trackedInRow = trackedInRow
        self.severity = severity
        self.temperature = temperature
        self.creationType = creationType
        self.timeStamp = timeStamp
    }
}

class TimeStamp: Codable {
    
    static var shared = TimeStamp()
    
    var nanoseconds = 0
    var seconds = Int()
}
