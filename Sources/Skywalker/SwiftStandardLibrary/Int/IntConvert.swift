//
//  IntConvert.swift
//  
//
//  Created by 杨俊艺 on 2022/2/21.
//

import Foundation

public extension Int {
    
    /// 罗马数字字符串表示
    var romanNumeral: String {
        RomanNumeralConverter.init().convert(self)
    }
}
