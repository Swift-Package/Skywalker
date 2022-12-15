//
//  ArrayParallelForEach.swift
//  
//
//  Created by 杨俊艺 on 2022/12/15.
//

import Foundation

public extension Array {
    
    /// 并行迭代数组中的各个元素
    /// - Parameter body: 迭代操作
    func parallelForEach(_ body: (Element) -> Void) {
        DispatchQueue.concurrentPerform(iterations: count) { index in
            body(self[index])
        }
    }
}
