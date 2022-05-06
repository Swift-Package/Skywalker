//
//  SortedSelf.swift
//  
//
//  Created by 杨俊艺 on 2022/5/4.
//

import Foundation

/// 指定KeyPath排序规则的数组属性包装器使用介绍查看单元测试
@propertyWrapper
public struct SortedSelf<Element, SortProperty: Comparable> {
    var array: [Element] = []
    let sortProperty: KeyPath<Element, SortProperty>
    
    public var wrappedValue: [Element] {
        get { return array }
        set { array = newValue.sorted(by: { $0[keyPath: sortProperty] < $1[keyPath: sortProperty] }) }
    }
    
    init(wrappedValue: [Element], by sortProperty: KeyPath<Element, SortProperty>) {
        self.sortProperty = sortProperty
        self.wrappedValue = wrappedValue
    }
    
}
