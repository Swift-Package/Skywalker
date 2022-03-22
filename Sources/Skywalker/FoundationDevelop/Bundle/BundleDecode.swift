//
//  BundleDecode.swift
//  
//
//  Created by 杨俊艺 on 2022/3/22.
//

import Foundation

@objc
public extension Bundle {
    
    @nonobjc
    static func decode<T: Codable>(_ type: T.Type, from filename: String) -> T {
        guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else { fatalError("Failed to locate \(filename) in app bundle.") }
        guard let data = try? Data(contentsOf: url) else { fatalError("Failed to load projects.json in app bundle.") }
        guard let loaded = try? JSONDecoder().decode(type, from: data) else { fatalError("Failed to decode projects.json from app bundle.") }

        return loaded
    }
}
