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
}
