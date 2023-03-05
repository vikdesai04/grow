//
//  PlantLottie.swift
//  grow-ios
//
//  Created by Abhishek More on 8/13/20.
//  Copyright © 2020 hackthis. All rights reserved.
//

import SwiftUI

struct PlantLottie: View {
    var body: some View {
        VStack {
            LottieView(filename: "Plant", loop: true)
            .frame(width: 400, height: 250)
        }
    }
}

struct PlantLottie_Previews: PreviewProvider {
    static var previews: some View {
        PlantLottie()
    }
}
