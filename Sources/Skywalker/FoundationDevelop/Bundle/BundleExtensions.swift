//
//  BundleExtensions.swift
//  
//
//  Created by 杨俊艺 on 2022/1/23.
//

import Foundation

// 用来处理xcconfig文件中的反斜杠
// BACKEND_URL = http:\/\/api.intensifystudio.com/development
public func infoForKey(_ key: String) -> String? {
    return (Bundle.main.infoDictionary?[key] as? String)?.replacingOccurrences(of: "\\", with: "")
 }

/// 用来读取Plist字典文件
enum PlistConfig {
    static func stringValue(forKey key: String) -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key) as? String else { fatalError("Invalid value or undefined key") }
        return value
  }
}

@objc
public extension Bundle {
    enum Configuration {
        enum Error: Swift.Error {
            case missingKey, invalidValue
        }
        
        static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
            guard let object = Bundle.main.object(forInfoDictionaryKey: key) else { throw Error.missingKey }
            
            switch object {
                case let value as T:
                    return value
                case let string as String:
                    guard let value = T(string) else { fallthrough }
                    return value
                default:
                    throw Error.invalidValue
            }
        }
    }
}

@objc
public extension Bundle {
    
    @nonobjc func decode<T: Codable>(_ type: T.Type, from filename: String) -> T {
        guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else { fatalError("Failed to locate \(filename) in app bundle.") }
        guard let data = try? Data(contentsOf: url) else { fatalError("Failed to load projects.json in app bundle.") }
        guard let loaded = try? JSONDecoder().decode(type, from: data) else { fatalError("Failed to decode projects.json from app bundle.") }

        return loaded
    }
}
