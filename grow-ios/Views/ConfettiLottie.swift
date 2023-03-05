//
//  ConfettiLottie.swift
//  grow-ios
//
//  Created by Abhishek More on 8/13/20.
//  Copyright © 2020 hackthis. All rights reserved.
//

import SwiftUI

struct ConfettiLottie: View {
    var body: some View {
        VStack {
            LottieView(filename: "Confetti", loop: false)
            .frame(width: 400, height: 250)
        }
    }
}

struct ConfettiLottie_Previews: PreviewProvider {
    static var previews: some View {
        ConfettiLottie()
    }
}
