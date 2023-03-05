//
//  LoginHeader.swift
//  grow-ios
//
//  Created by Sahil Ambardekar on 8/10/20.
//  Copyright © 2020 hackthis. All rights reserved.
//

import SwiftUI

struct LoginHeader: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("hi,")
                .font(.custom("Cabin-Bold", size: 24))
            HStack {
                Text("welcome to ")
                    .font(.custom("Cabin-Bold", size: 30))
                    .fontWeight(.bold) +
                Text("grow")
                    .font(.custom("Cabin-Bold", size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 64/255, green: 100/255, blue: 25/255))
            }
        }
    }
}

struct LoginHeader_Previews: PreviewProvider {
    static var previews: some View {
        LoginHeader()
    }
}
