//
//  FocusActivity.swift
//  grow-ios
//
//  Created by Abhishek More on 8/9/20.
//  Copyright © 2020 hackthis. All rights reserved.
//

import SwiftUI

struct FocusActivity: View {
    let color: Color
    let text: String
    var body: some View {
        ZStack(alignment: .topLeading){
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 100, height: 135)
                .foregroundColor(color)
                .shadow(color: Color.black.opacity(0.25), radius: 12, x: 0, y: 4)
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color.white.opacity(0.4))
                Text(text)
                    .foregroundColor(.white)
                    .font(.custom("Cabin-Bold", size: 24))
            }.padding([.top, .leading], 10)
        }
    }
}

struct ActivityData: Hashable {
    let timeString: String
    let seconds: Int
    let color: Color
}

struct FocusActivity_Previews: PreviewProvider {
    static var previews: some View {
        FocusActivity(color: Color.green1, text: "1h")
        
    }
}
