//
//  Pomodoro.swift
//  Pomodoro
//
//  Created by Jason Hough on 2/23/19.
//  Copyright © 2019 Jason Hough. All rights reserved.
//

import Foundation

class Pomodoro {
    // Location
    var time: TimeInterval
    var breakTime: TimeInterval
    var failedAtTime: TimeInterval?
    var listOfDistractionTimes: [TimeInterval] = []
    
    init () {
        time = SettingsConfig.TimerLengthInSeconds
        breakTime = SettingsConfig.BreakLengthInSeconds
    }
}
