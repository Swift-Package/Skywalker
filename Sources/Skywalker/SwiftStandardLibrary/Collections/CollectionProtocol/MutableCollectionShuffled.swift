//
//  MutableCollectionShuffled.swift
//  
//
//  Created by 杨俊艺 on 2022/2/21.
//

import Foundation

public extension MutableCollection {
    /// 打乱可变集合元素
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
    
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d = Int(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
        
    }
    
}
