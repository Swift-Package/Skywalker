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
        guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else { fatalError("Skywalker 文件路径不存在 \(filename)") }
        guard let data = try? Data(contentsOf: url) else { fatalError("Skywalker 读取文件失败 \(filename)") }
        
        do {
            let decodeData = try JSONDecoder().decode(type, from: data)
            return decodeData
        } catch DecodingError.keyNotFound(let key, let context) {
            print("Skywalker Key不存在", key, context)
        } catch DecodingError.typeMismatch(let type, let context) {
            print("Skywalker 类型不匹配", type, context)
        } catch DecodingError.valueNotFound(let value, let context) {
            print("Skywalker Value不存在", value, context)
        } catch DecodingError.dataCorrupted(let context) {
            print("Skywalker 数据损坏", context)
        } catch {
            fatalError("Skywalker 解码出错")
        }
        
        fatalError("Skywalker 解码出错")
    }
}
