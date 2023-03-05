//
//  WelcomeHeader.swift
//  grow-ios
//
//  Created by Sahil Ambardekar on 8/9/20.
//  Copyright © 2020 hackthis. All rights reserved.
//

import SwiftUI

struct WelcomeHeader: View {
    let name: String
    let streak: Int
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("hello")
                    .font(.custom("Cabin-Bold", size: 24))
                    .foregroundColor(Color(red: 64/255, green: 100/255, blue: 25/255)) +
                Text(", \(name)")
                    .font(.custom("Cabin-Bold", size: 24))
            }
            if streak != 0 {
                Text("you're on a \(streak) day streak!")
                    .font(.custom("Cabin-Bold", size: 30))
                    .fontWeight(.bold)
            } else {
                 Text("make sure to focus today!")
                    .font(.custom("Cabin-Bold", size: 30))
                    .fontWeight(.bold)
            }
        }
    }
}

struct WelcomeHeader_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeHeader(name: "Abhishek", streak: 5)
    }
}
