//
//  SecureStoreQueryable.swift
//  
//
//  Created by 杨俊艺 on 2022/9/23.
//

import Foundation

public protocol SecureStoreQueryable {
    var query: [String: Any] { get }
}

public struct GenericPasswordQueryable {
    
    let service: String
    let accessGroup: String?
  
    init(service: String, accessGroup: String? = nil) {
        self.service = service
        self.accessGroup = accessGroup
    }
}

extension GenericPasswordQueryable: SecureStoreQueryable {
    public var query: [String : Any] {
        var query: [String: Any] = [:]
        query[String(kSecClass)] = kSecClassGenericPassword// Keychain通过这个推断出需要加密
        query[String(kSecAttrService)] = service
        // 如果没有在模拟器上运行可以将kSecAttrAccessGroupkey设置为提供的accessGroup值
        // 这使您可以在具有相同访问权限组的不同应用程序之间共享项目
        #if !targetEnvironment(simulator)
        if let accessGroup {
            query[String(kSecAttrAccessGroup)] = accessGroup
        }
        #endif
        return query
    }
}

public struct InternetPasswordQueryable {
    let server: String
    let port: Int
    let path: String
    let securityDomain: String
    let internetProtocol: InternetProtocol
    let internetAuthenticationType: InternetAuthenticationType
}

extension InternetPasswordQueryable: SecureStoreQueryable {
    public var query: [String : Any] {
        var query: [String: Any] = [:]
        query[String(kSecClass)] = kSecClassInternetPassword
        query[String(kSecAttrPort)] = port
        query[String(kSecAttrService)] = server
        query[String(kSecAttrSecurityDomain)] = securityDomain
        query[String(kSecAttrPath)] = path
        query[String(kSecAttrProtocol)] = internetProtocol.rawValue
        query[String(kSecAttrAuthenticationType)] = internetAuthenticationType.rawValue
        
        return query
    }
}
