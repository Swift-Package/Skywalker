//
//  RomanNumeralConverter.swift
//  
//
//  Created by 杨俊艺 on 2022/2/21.
//

import Foundation

@objcMembers
public class RomanNumeralConverter: NSObject {
    
    /// 将Int转换为罗马数字表示的字符串
    /// - Parameter number: 需要转换的数值
    /// - Returns: 需要转换的数值的罗马数字字符串表示
    public func convert(_ number: Int) -> String {
        var localNumber = number
        var result = ""

        let numberSymbols: [(number: Int, symbol: String)] =
            [(1000, "M"),
             (900, "CM"),
             (500, "D"),
             (400, "CD"),
             (100, "C"),
             (90, "XC"),
             (50, "L"),
             (40, "XL"),
             (10, "X"),
             (9, "IX"),
             (5, "V"),
             (4, "IV"),
             (1, "I")]
      
        for item in numberSymbols {
            while localNumber >= item.number {
                result += item.symbol
                localNumber = localNumber - item.number
            }
        }
        return result
    }
}
