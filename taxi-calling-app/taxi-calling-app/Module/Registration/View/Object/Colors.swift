//
//  Colors.swift
//  taxi-calling-app
//
//  Created by Ayberk Bilgiç on 8.01.2025.
//

import Foundation
import UIKit

// MARK: - Color Palette
enum Colors {
    static let primary = UIColor(hex: "4CAF50")     // Main green
    static let secondary = UIColor(hex: "A5D6A7")   // Light green
    static let background = UIColor(hex: "E8F5E9")  // Very light green
    static let accent = UIColor(hex: "2E7D32")      // Dark green
    
    static let softB = UIColor(hex: "F5FCF5")
    static let darkB = UIColor(hex: "5DC476")
}

// MARK: - Extensions
extension UIColor {
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            red: CGFloat(r) / 255,
            green: CGFloat(g) / 255,
            blue: CGFloat(b) / 255,
            alpha: CGFloat(a) / 255
        )
    }
}

