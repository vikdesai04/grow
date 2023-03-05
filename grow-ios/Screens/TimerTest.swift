//
//  TimerTest.swift
//  grow-ios
//
//  Created by Abhishek More on 8/12/20.
//  Copyright © 2020 hackthis. All rights reserved.
//

import SwiftUI

struct TimerTest: View {
    
    @ObservedObject var timerManager = TimerManager()
    @State var selectedPickerIndex = 0
    
    let availableMinutes = Array(1...59)
    
    var body: some View {
        
        VStack {
            Text("\(timerManager.secondsLeft)")
            Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                .resizable()
                .frame(width: 75, height: 75)
                .onTapGesture(perform: {
                    if self.timerManager.timerMode == .initial {
                        self.timerManager.setTimerLength(seconds: self.availableMinutes[self.selectedPickerIndex])
                    }
                    self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                    
                })
            if timerManager.timerMode == .paused {
                Image(systemName: "gobackward")
                .onTapGesture(perform: {
                    self.timerManager.reset(seconds: 6)
                })
            }
            
            if timerManager.timerMode == .initial {
                Picker(selection: $selectedPickerIndex, label: Text("")) {
                    ForEach(0..<availableMinutes.count) {
                        Text("\(self.availableMinutes[$0]) min")
                    }
                }.labelsHidden()
            }
            
        }
        
    }
}

struct TimerTest_Previews: PreviewProvider {
    static var previews: some View {
        TimerTest()
    }
}
