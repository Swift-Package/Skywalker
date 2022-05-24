//
//  StringSplit.swift
//  
//
//  Created by 杨俊艺 on 2022/5/24.
//

import Foundation

public extension String {
    /// 将字符串分割成由等长子字符串组成的数组
    /// - Parameter length: 子字符串长度
    /// - Returns: 子字符串组成的数组
    func split(by length: Int) -> [String] {
        var startIndex = self.startIndex
        var results = [Substring]()
        
        while startIndex < self.endIndex {
            let endIndex = self.index(startIndex, offsetBy: length, limitedBy: self.endIndex) ?? self.endIndex
            results.append(self[startIndex..<endIndex])
            startIndex = endIndex
        }
        
        return results.map { String($0) }
    }
    
}
