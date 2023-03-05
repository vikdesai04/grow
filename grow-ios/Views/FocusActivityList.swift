//
//  FocusActivityList.swift
//  grow-ios
//
//  Created by Abhishek More on 8/9/20.
//  Copyright © 2020 hackthis. All rights reserved.
//

import SwiftUI
 
 let activities = [
    ActivityData(timeString: "1h", seconds: 3600, color: Color.green1),
    ActivityData(timeString: "2h", seconds: 7200, color: Color.green2),
    ActivityData(timeString: "3m", seconds: 180, color: Color.green3),
    ActivityData(timeString: "5s", seconds: 5, color: Color.green1),

 
 ]

struct FocusActivityList: View {
    
    @State private var showModal: Bool = false
    var userData: UserData
    @State var active: ActivityData = ActivityData(timeString: "1h", seconds: 3600, color: Color.green)
    var body: some View {
    
        VStack(alignment: .leading) {
            Text("focus activities")
                .font(.custom("Cabin-Bold", size: 24))
                .padding(.leading, 30)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(activities, id: \.self) { activity in
                        FocusActivity(color: activity.color, text: "\(activity.timeString)")
                            .onTapGesture {
                                self.active = activity
                                self.showModal.toggle()
                        }
                        
                    }
                    // TODO: insert custom FocusActivity
                }
                .sheet(isPresented: $showModal) {
                    FocusTime(userData: self.userData, startTimeSeconds: self.active.seconds, time: self.active.timeString)
                }
                .padding([.leading, .trailing], 30)
                .frame(height: 200)
            }
        }
    }
}
