//
//  Pallete.swift
//  grow-ios
//
//  Created by Abhishek More on 8/10/20.
//  Copyright © 2020 hackthis. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    static let offwhite = Color(red: 225/255, green: 225/255, blue: 235/255)
    static let green1 = Color(red: 55/255, green: 146/255, blue: 9/255)
    static let green2 = Color(red: 197/255, green: 241/255, blue: 132/255)
    static let green3 = Color(red: 115/255, green: 164/255, blue: 63/255)
    static let gray1 = Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
    
    func uiColor() -> UIColor {
        
        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }
    
    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        
        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        
        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
    }
}
