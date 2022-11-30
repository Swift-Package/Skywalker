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
    
    /// 返回两两配对的元组组成的数组,比如[1, 2, 3, 4] -> [(1, 2), (2, 3), (3, 4)]
    /// - Returns: 元组数组
    func eachPair() -> AnySequence<(Iterator.Element, Iterator.Element)> { AnySequence.init(zip(self, self.dropFirst())) }
}


