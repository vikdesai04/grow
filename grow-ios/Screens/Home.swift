//
//  Home.swift
//  grow-ios
//
//  Created by Abhishek More on 8/9/20.
//  Copyright © 2020 hackthis. All rights reserved.
//

import SwiftUI

struct Home: View {
    var userData: UserData
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing){
                VStack(alignment: .leading){
                    Token()
                        .padding(.top, -25)
                    WelcomeHeader(name: "Abhishek", streak: 5)
                        .padding(.bottom, 75)
                        .padding(.top, -5)
                        .padding(.leading, 30)
                    FocusActivityList(userData: userData)
                    Spacer()
//                    HStack {
//                        Spacer()
//                        Image("weow")
//                            .padding(.bottom, 50)
//                    }
                }.padding(.top, -50.0)
                ManLottie()
            }
            
        }
    }
}
