//
//  XCConfiguration.swift
//  
//
//  Created by 杨俊艺 on 2022/9/14.
//

import Foundation

/// 用来读取Xcode配置文件的键值
public enum XCConfiguration {
    static func stringValue(forKey key: String) -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key) as? String else {
            fatalError("Invalid value or undefined key")
        }
        return value
    }
}
