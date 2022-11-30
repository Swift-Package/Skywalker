//
//  KeychainSecureStore.swift
//  
//
//  Created by 杨俊艺 on 2022/9/23.
//

// https://www.raywenderlich.com/9240-keychain-services-api-tutorial-for-passwords-in-swift
import Foundation
import Security

public struct KeychainSecureStore {
    
    let secureStoreQueryable: SecureStoreQueryable
  
    public init(secureStoreQueryable: SecureStoreQueryable) {
        self.secureStoreQueryable = secureStoreQueryable
    }
    
    // MARK: 保存特定账户的密码
    public func setValue(_ value: String, for userAccount: String) throws {
        guard let encodedPassword = value.data(using: .utf8) else {
            throw SecureStoreError.string2DataConversionError
        }
    
        var query = secureStoreQueryable.query
        query[String(kSecAttrAccount)] = userAccount
        
        // 查询
        var status = SecItemCopyMatching(query as CFDictionary, nil)
        switch status {
        case errSecSuccess:// 如果存在则更新
            var attributesToUpdates: [String: Any] = [:]
            attributesToUpdates[String(kSecValueData)] = encodedPassword
            status = SecItemUpdate(query as CFDictionary, attributesToUpdates as CFDictionary)
            if status != errSecSuccess {
                throw error(from: status)
            }
        case errSecItemNotFound:// 不存在则新增
            query[String(kSecValueData)] = encodedPassword
            status = SecItemAdd(query as CFDictionary, nil)
            if status != errSecSuccess {
                throw error(from: status)
            }
        default:
            throw error(from: status)
        }
    }
    
    // MARK: 获取特定账户的密码
    public func getValue(for userAccount: String) throws -> String? {
        var query = secureStoreQueryable.query
        query[String(kSecAttrAccount)] = userAccount
        query[String(kSecReturnData)] = kCFBooleanTrue// 将未加密的数据作为结果返回
        query[String(kSecMatchLimit)] = kSecMatchLimitOne// 要求它返回单个结果
        query[String(kSecReturnAttributes)] = kCFBooleanTrue// 返回与该特定项目关联的所有属性
    
        var queryResult: AnyObject?
        let status = withUnsafeMutablePointer(to: &queryResult) {
            SecItemCopyMatching(query as CFDictionary, $0)
        }
        
        switch status {
        case errSecSuccess:
            guard let queriedItem = queryResult as? [String: Any],
                  let passwordData = queriedItem[String(kSecValueData)] as? Data,
                  let password = String.init(data: passwordData, encoding: .utf8) else {
                throw SecureStoreError.data2StringConversionError
            }
            return password
        case errSecItemNotFound:
            return nil
        default:
            throw error(from: status)
        }
    }
    
    // MARK: 删除特定账户的密码
    public func removeValue(for userAccount: String) throws {
        var query = secureStoreQueryable.query
        query[String(kSecAttrAccount)] = userAccount
        let status = SecItemDelete(query as CFDictionary)
        
        guard status == errSecSuccess || status == errSecItemNotFound else { throw error(from: status) }
    }
    
    // MARK: 删除与特定服务相关联的所有密码
    public func removeAllValues() throws {
        let query = secureStoreQueryable.query
        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else { throw error(from: status) }
    }
    
    // MARK: 通过OSStatus获取状态表示的人类可读字符串
    private func error(from status: OSStatus) -> SecureStoreError {
        let message = SecCopyErrorMessageString(status, nil) as String? ?? NSLocalizedString("Unhandled Error", comment: "")
        return SecureStoreError.unhandledError(message: message)
    }
}
