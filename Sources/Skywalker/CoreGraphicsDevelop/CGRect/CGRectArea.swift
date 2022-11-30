//
//  CGRectArea.swift
//  
//
//  Created by 杨俊艺 on 2022/5/1.
//

import CoreGraphics

public extension CGRect {
    
    /// 获取矩形区域外圈1像素矩形线框
    /// - Returns: 1像素矩形线框
    func rectFor1PxStroke() -> CGRect {
        CGRect(x: origin.x + 0.5, y: origin.y + 0.5, width: size.width - 1, height: size.height - 1)
    }
}
