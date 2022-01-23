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
