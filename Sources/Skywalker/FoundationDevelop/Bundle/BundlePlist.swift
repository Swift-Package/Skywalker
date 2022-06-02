//
//  BundlePlist.swift
//  
//
//  Created by 杨俊艺 on 2022/3/22.
//

import Foundation

// 用来处理xcconfig文件中的反斜杠
// BACKEND_URL = http:\/\/api.intensifystudio.com/development
public func infoForKey(_ key: String) -> String? {
    return (Bundle.main.infoDictionary?[key] as? String)?.replacingOccurrences(of: "\\", with: "")
 }

/// 用来读取工程中的Info.Plist字典文件
public enum PlistConfig {
    static func stringValue(forKey key: String) -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key) as? String else { fatalError("Invalid value or undefined key") }
        return value
  }
}

// let url = URL(string: path, relativeTo: API.baseURL)!
public enum API {
    static var baseURL: URL {
        return try! URL(string: "https://" + XcodeConfiguration.value(for: "API_BASE_URL"))!
    }
}

public enum XcodeConfiguration {
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

//func getDataFromInfoPlist(){
//    if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
//       let infoListValue = NSDictionary(contentsOfFile: path)
//        do {
//            let JsonData = try JSONSerialization.data(withJSONObject: infoListValue as Any, options: .prettyPrinted)
//            let val = NSString(data: JsonData, encoding: String.Encoding.utf8.rawValue)! as String
//            print(val)
//        } catch {
//            print(error.localizedDescription)
//        }
//
//    }
//}
