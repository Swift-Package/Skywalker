//
//  ClampingRange.swift
//  
//
//  Created by 杨俊艺 on 2022/4/19.
//

import Foundation

/// 指定属性值边界的包装器
@propertyWrapper
public struct ClampingRange<Value: Comparable> {
    var value: Value
    let range: ClosedRange<Value>
    
    public var wrappedValue: Value {
        get { value }
        set { value = min(max(range.lowerBound, newValue), range.upperBound) }
    }
    
    /// 指定属性值边界的包装器 @ClampingRange(0...14) var pH: Double = 7
    /// - Parameters:
    ///   - wrappedValue: 初始值
    ///   - range: 限定范围
    public init(wrappedValue: Value, _ range: ClosedRange<Value>) {
        precondition(range.contains(wrappedValue))
        self.value = wrappedValue
        self.range = range
    }
    
}
