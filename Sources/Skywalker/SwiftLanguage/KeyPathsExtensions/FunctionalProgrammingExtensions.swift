//
//  FunctionalProgrammingExtensions.swift
//  
//
//  Created by 杨俊艺 on 2022/12/14.
//

// https://www.youtube.com/watch?v=gsPOl26C6VQ

import Foundation

public func > <Root, Value: Comparable>(_ leftHandSide: KeyPath<Root, Value>, _ rightHandSide: Value) -> (Root) -> Bool {
    return { $0[keyPath: leftHandSide] > rightHandSide }
}

public func < <Root, Value: Comparable>(_ leftHandSide: KeyPath<Root, Value>, _ rightHandSide: Value) -> (Root) -> Bool {
    return { $0[keyPath: leftHandSide] < rightHandSide }
}

public func >= <Root, Value: Comparable>(_ leftHandSide: KeyPath<Root, Value>, _ rightHandSide: Value) -> (Root) -> Bool {
    return { $0[keyPath: leftHandSide] >= rightHandSide }
}

public func <= <Root, Value: Comparable>(_ leftHandSide: KeyPath<Root, Value>, _ rightHandSide: Value) -> (Root) -> Bool {
    return { $0[keyPath: leftHandSide] <= rightHandSide }
}

public func == <Root, Value: Comparable>(_ leftHandSide: KeyPath<Root, Value>, _ rightHandSide: Value) -> (Root) -> Bool {
    return { $0[keyPath: leftHandSide] == rightHandSide }
}

public func != <Root, Value: Comparable>(_ leftHandSide: KeyPath<Root, Value>, _ rightHandSide: Value) -> (Root) -> Bool {
    return { $0[keyPath: leftHandSide] != rightHandSide }
}
