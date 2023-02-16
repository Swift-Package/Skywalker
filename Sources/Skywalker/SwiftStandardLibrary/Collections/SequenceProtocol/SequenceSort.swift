//
//  File.swift
//
//
//  Created by 杨俊艺 on 2022/6/12.
//

import Foundation

// Coordinator协调器作者在2017年的技术演讲
// https://www.youtube.com/watch?v=3ia3ngqM2mM

public extension Sequence {
    /// 通过属性进行排序
    /// - Parameter propertyAccessor: 比如arr.sorted(on: { $0.numberOfSeed })
    /// - Returns: 元素排序后的数组
    func sorted<T: Comparable>(on propertyAccessor: (Iterator.Element) -> T) -> [Iterator.Element] {
        return sorted(by: { propertyAccessor($0) < propertyAccessor($1) })
    }
}
