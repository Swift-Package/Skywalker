//
//  StringShuffled.swift
//  
//
//  Created by 杨俊艺 on 2022/2/21.
//

import Foundation

public extension String {
    
    /// 打乱字符串
    /// - Returns: 打乱后的新字符串
    func garbled() -> String {
        String(shuffled())
    }
}
