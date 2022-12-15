//
//  UserDefaultsWrapper.swift
//  
//
//  Created by 杨俊艺 on 2022/3/13.
//

// https://www.youtube.com/watch?v=vyp8BaBVOhw

import Foundation

/// UserDefaults包装器
@propertyWrapper
public struct UserDefault<T> {
    
    private let key: String
    private let defaultValue: T
    private var storage: UserDefaults = .standard
    
    /// 使用@UserDefault("USES_TOUCH_ID", defaultValue: true) static var usesTouchID: Bool
    /// - Parameters:
    ///   - key: 保存在UserDefaults中的键名
    ///   - defaultValue: 默认值
    public init(storage: UserDefaults = .standard, _ key: String, defaultValue: T) {
        self.storage = storage
        self.key = key
        self.defaultValue = defaultValue
        storage.register(defaults: [key : defaultValue])
    }
    
    public var wrappedValue: T {
        get { storage.object(forKey: key) as? T ?? defaultValue }
        set { storage.set(newValue, forKey: key) }
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


@propertyWrapper
public struct UserDefaultCodable<T: Codable> {
    
    let key: String
    let defaultValue: T
    var storage: UserDefaults = .standard
    
    public var wrappedValue: T {
        get {
            guard let data = storage.value(forKey: key) as? Data,
                  let value = try? JSONDecoder.init().decode(T.self, from: data)
            else {
                return defaultValue
            }
            return value
        }
        set { storage.set(try? JSONEncoder.init().encode(newValue), forKey: key) }
    }
}
