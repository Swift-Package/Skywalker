//
//  SequenceShuffled.swift
//  
//
//  Created by 杨俊艺 on 2022/2/21.
//

import Foundation

public extension Sequence {
    
    /// 返回元素打乱后的新序列
    /// - Returns: 元素打乱后的新序列
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
    
}


