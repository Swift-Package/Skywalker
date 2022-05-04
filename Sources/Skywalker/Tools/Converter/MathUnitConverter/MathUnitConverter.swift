//
//  MathUnitConverter.swift
//  
//
//  Created by 杨俊艺 on 2022/4/30.
//

import UIKit

/// 数学单位转换工具
@objcMembers
public class MathUnitConverter {
    /// 将度数转换成弧度
    /// - Parameter degress: 度数
    /// - Returns: 弧度
    public static func degreeToRadians(_ degress: CGFloat) -> CGFloat {
        CGFloat.pi * degress / 180.0
    }
    
}

