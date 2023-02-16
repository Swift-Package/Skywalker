//
//  CooperationOperator.swift
//
//
//  Created by 杨俊艺 on 2022/11/28.
//

import Foundation

infix operator >>>
/// 将两个函数组合起来
/// - Parameters:
///   - preFunc: 第一次操作函数
///   - targetFunc: 第二次操作函数
/// - Returns: 两次操作函数合并后的目标函数
public func >>> <A, B, C>(frontFunc: @escaping (A) -> B, afterFunc: @escaping (B) -> C) -> (A) -> C {
    return { afterFunc(frontFunc($0)) }
}
