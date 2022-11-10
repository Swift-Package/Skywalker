//
//  UIColorExtensions.swift
//  
//
//  Created by 杨俊艺 on 2022/5/10.
//

import UIKit

@objc
public extension UIColor {
    
    static func random() -> UIColor {
        UIColor.init(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    func lighterColor() -> UIColor {
        var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor(hue: hue, saturation: saturation, brightness: min(brightness * CGFloat(1.3), CGFloat(1.0)), alpha: alpha)
        }
        return self
    }

    func darkerColor() -> UIColor {
        var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor(hue: hue, saturation: saturation, brightness: brightness * CGFloat(0.92), alpha: alpha)
        }
        return self
    }
}
