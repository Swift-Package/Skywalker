//
//  CGPointCalculation.swift
//  
//
//  Created by 杨俊艺 on 2022/5/1.
//

import CoreGraphics

public extension CGPoint {
    static func +(left: CGPoint, right: CGFloat) -> CGPoint {
        return CGPoint(x: left.x + right, y: left.y + right)
    }
    
}
