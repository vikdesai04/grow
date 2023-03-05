//
//  LoginField.swift
//  grow-ios
//
//  Created by Sahil Ambardekar on 8/11/20.
//  Copyright © 2020 hackthis. All rights reserved.
//

import SwiftUI

struct LoginField: View {
    let title: String
    @State var placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.custom("Cabin-Bold", size: 24))
                .fontWeight(.bold)
                .foregroundColor(Color.gray)
            MaterialUITextField(placeholder: $placeholder, text: $text)
                .frame(width: 200, height: 30, alignment: .leading)
                .padding(.top, 12)
        }
    }
}
