//
//  UserDefaultsExtensions.swift
//  
//
//  Created by 杨俊艺 on 2022/1/23.
//

import Foundation

enum UserDefaultsHelper {
    static private let defaults = UserDefaults(suiteName: Config.stringValue(forKey: "USER_DEFAULTS_SUITE_NAME")) ?? .standard
    
    // 分离各个环境的数据
    static private let recordsKey = Config.stringValue(forKey: "USER_DEFAULTS_RECORDS_KEY")
    
    static func getRecords() -> [Hatchling] {
        guard let objects = defaults.value(forKey: recordsKey) as? Data,
              let hatchlings = try? JSONDecoder().decode([Hatchling].self, from: objects)
        else { return [] }
        
        return hatchlings
    }
    
    static func persistRecords(_ array: [Hatchling]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(array) {
            defaults.set(encoded, forKey: recordsKey)
        }
    }
    
    static func clearRecords() {
        defaults.removeObject(forKey: recordsKey)
    }
    
    static func getRecordsCount() -> Int {
        return getRecords().count
    }
    
}

struct Hatchling: Codable {
    var id = UUID()
    var tag: String
    var date: Date
    
    static func generatePreviewHatchlings() -> [Hatchling] {
        let leo = Hatchling(tag: "Leonardo", date: Date())
        let don = Hatchling(tag: "Donatello", date: Date())
        return [leo, don]
    }
    
}

enum Config {
    static func stringValue(forKey key: String) -> String {
        guard let value = Bundle.main.object(forInfoDictionaryKey: key) as? String else {
            fatalError("Invalid value or undefined key")
        }
        return value
    }
}

