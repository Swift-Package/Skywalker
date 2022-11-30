//
//  JSONDecoderExtensions.swift
//  
//
//  Created by 杨俊艺 on 2022/8/23.
//

import Foundation

// MARK: - 代码来自Raywenderlich的专家级Swift关于编解码一章

/// 自定义的解码规则
public struct AnyCodingKey: CodingKey {
    
    public let intValue: Int?
    public let stringValue: String
    
    public init?(stringValue: String) {
        self.intValue = nil
        self.stringValue = stringValue
    }
    
    public init?(intValue: Int) {
        self.intValue = intValue
        self.stringValue = "\(intValue)"
    }
}

public extension JSONDecoder.KeyDecodingStrategy {
    /// 短横线规则例如JSON中store-link转换成storeLink
    static var convertFromKebabCase: JSONDecoder.KeyDecodingStrategy = .custom { keys in
        // 获取数组中的最后一个编码键
        // 编码键数组表示从JSON的根到您正在处理的特定键的整个路径因此在这种情况下您只对最后一个感兴趣
        let codingKey = keys.last!
        let key = codingKey.stringValue
        
        // 如果密钥不包含破折号则绝对不是kebab-case因此您按原样返回编码密钥
        guard key.contains("-") else { return codingKey }
        
        // 如果是kebab-case则用破折号分割键并将除第一个单词之外的每个单词都大写
        let words = key.components(separatedBy: "-")
        let camelCased = words[0] + words[1...].map(\.capitalized).joined()
        
        return AnyCodingKey.init(stringValue: camelCased)!
    }
}
