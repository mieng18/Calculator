//
//  Color+Extensions.swift
//  Calculator-SwiftUI
//
//  Created by mai nguyen on 8/8/23.
//

import SwiftUI

extension Color {
    
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }
}


extension Color {

    static let blue0060E5 = Color(0x0060E5)
    static let gray363E4D = Color(0x363E4D)
    static let darkGray242933 = Color(0x242933)
    static let textCBE1FF = Color(0xCBE1FF)

    

}
