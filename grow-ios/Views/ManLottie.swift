//
//  ManLottie.swift
//  grow-ios
//
//  Created by Abhishek More on 8/13/20.
//  Copyright © 2020 hackthis. All rights reserved.
//

import SwiftUI

struct ManLottie: View {
    var body: some View {
        VStack {
            LottieView(filename: "Working", loop: true)
            .frame(width: 400, height: 250)
        }
    }
}

struct ManLottie_Previews: PreviewProvider {
    static var previews: some View {
       ManLottie()
    }
}
