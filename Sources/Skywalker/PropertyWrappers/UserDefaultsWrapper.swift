//
//  UserDefaultsWrapper.swift
//  
//
//  Created by 杨俊艺 on 2022/3/13.
//

import Foundation

/// UserDefaults包装器
@propertyWrapper
public struct UserDefault<T> {
    
    private let key: String
    private let defaultValue: T
    
    /// 使用@UserDefault("USES_TOUCH_ID", defaultValue: true) static var usesTouchID: Bool
    /// - Parameters:
    ///   - key: 保存在UserDefaults中的键名
    ///   - defaultValue: 默认值
    public init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
        UserDefaults.standard.register(defaults: [key : defaultValue])
    }
    
    public var wrappedValue: T {
        get { UserDefaults.standard.object(forKey: key) as? T ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }
}

// 👆的包装器为了避免👇的反面模式
var usesTouchID: Bool {
    get { UserDefaults.standard.bool(forKey: "USES_TOUCH_ID") }
    set { UserDefaults.standard.set(newValue, forKey: "USES_TOUCH_ID") }
}

var isLoggedIn: Bool {
    get { UserDefaults.standard.bool(forKey: "LOGGED_IN") }
    set { UserDefaults.standard.set(newValue, forKey: "LOGGED_IN") }
}
