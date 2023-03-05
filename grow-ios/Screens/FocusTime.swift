//
//  Timer.swift
//  grow-ios
//
//  Created by Abhishek More on 8/11/20.
//  Copyright © 2020 hackthis. All rights reserved.
//

import SwiftUI

struct FocusTime: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var userData: UserData
    @ObservedObject var timerManager = TimerManager()
    @State var percentage: CGFloat = 100
    
    let startTimeSeconds: Int
    let time: String
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .center) {
                Text("\(time) focus")
                    .foregroundColor(Color.green1)
                    .font(.custom("Cabin-Bold", size: 24))
                Spacer()
                if self.timerManager.secondsLeft != 0 {
                    ZStack {
                        Pulsation()
                        Track()
                        Text("\(getFormattedTime(seconds: timerManager.secondsLeft))")
                            .font(.custom("Cabin-Bold", size: 65))
                            .foregroundColor(Color.green3)
                            .onAppear() {
                                self.timerManager.setTimerLength(seconds: self.startTimeSeconds )
                        }
                        Outline(percentage: CGFloat(Float(self.timerManager.secondsLeft) / Float(self.startTimeSeconds) * 100))
                        
                    }
                } else {
                    Text("E").onAppear() {
                        self.userData.drops = self.userData.drops! + 10
                    }
                }
                Spacer()
                Image(systemName: timerManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                    .resizable()
                    .foregroundColor(Color.green1)
                    .frame(width: 75, height: 75)
                    .padding(.bottom, 50)
                    .onTapGesture(perform: {
                    if self.timerManager.timerMode == .initial {
                        self.timerManager.setTimerLength(seconds: self.startTimeSeconds)
                    }
                    self.timerManager.timerMode == .running ? self.timerManager.pause() : self.timerManager.start()
                    
                    })

            }.padding(.top, 60)
             .navigationBarBackButtonHidden(true)
            if self.timerManager.secondsLeft == 0 {
                ConfettiLottie()
                    .padding(.bottom, -10)
            }
            //PlantLottie()
        }
    }
}

struct Outline: View {
    var percentage: CGFloat
    var colors: [Color] = [Color.green1]
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.clear)
                .frame(width: 250, height: 250)
            .overlay(
                Circle()
                    .trim(from: 0.0, to: percentage * 0.01)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .fill(AngularGradient(gradient: .init(colors: colors), center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
            ).animation(.spring(response: 1.0, dampingFraction: 1, blendDuration: 1.0))
        }
    }
}

struct Track: View {
    var colors: [Color] = [Color.green2]
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
            .frame(width: 250, height: 250)
            .overlay(
                Circle()
                .stroke(style: StrokeStyle(lineWidth: 20))
                    .fill(AngularGradient(gradient: .init(colors: colors), center: .center))
            )
            
        }
    }
}

struct Pulsation: View {
    
    @State private var pulsate = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.green2.opacity(0.45))
                .frame(width: 245, height: 245)
                .scaleEffect(pulsate ? 1.3 : 1.1)
                .animation(Animation.easeInOut(duration: 1.1).repeatForever(autoreverses: true))
                .onAppear() {
                    self.pulsate.toggle()
                }
        }
    }
}
