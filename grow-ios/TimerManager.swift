//
//  TimerManager.swift
//  grow-ios
//
//  Created by Abhishek More on 8/12/20.
//  Copyright © 2020 hackthis. All rights reserved.
//

import Foundation
import SwiftUI

class TimerManager: ObservableObject {
    
    @Published var timerMode: TimerMode = .initial
    @Published var secondsLeft = 100 
    
    var timer = Timer()
    
    func start() {
        self.timerMode = .running
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            
            if self.secondsLeft == 0 {
                self.timerMode = .initial
                self.timer.invalidate()
                print("Completed")
            } else {
                self.secondsLeft -= 1
            }
            
        })
    }
    
    func setTimerLength(seconds: Int) {
        let defaults = UserDefaults.standard
        defaults.set(seconds, forKey: "timerLength")
        secondsLeft = seconds 
    }
    
    func reset(seconds: Int) {
        self.timerMode = .initial
        self.secondsLeft = seconds
        self.timer.invalidate()
    }
    
    func pause() {
        self.timerMode = .paused
        self.timer.invalidate()
    }

}

func getFormattedTime(seconds: Int) -> String  {
    
    var hourStamp = ""
    var minuteStamp = ""
    var secondStamp = ""
    
    let hours = seconds / 3600
    let minutes = seconds % 3600 / 60
    let secs = seconds % 3600 % 60
    
    if hours < 10 {
        hourStamp = "0\(hours)"
    } else {
        hourStamp = "\(hours)"
    }
    
    if minutes < 10 {
        minuteStamp = "0\(minutes)"
    } else {
        minuteStamp = "\(minutes)"
    }
    
    if secs < 10 {
        secondStamp = "0\(secs)"
    } else {
        secondStamp = "\(secs)"
    }
    
    
    if hours != 0 {
        return "\(hourStamp):\(minuteStamp)"
    } else {
        return "\(minuteStamp):\(secondStamp)"
    }
    
}


enum TimerMode {
    case running
    case paused
    case initial
}
