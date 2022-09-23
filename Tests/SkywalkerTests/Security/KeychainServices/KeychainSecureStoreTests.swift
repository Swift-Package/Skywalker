//
//  KeychainSecureStoreTests.swift
//  
//
//  Created by 杨俊艺 on 2022/9/23.
//

import XCTest
@testable import Skywalker

final class KeychainSecureStoreTests: XCTestCase {
    
    var secureStoreWithGenericPwd: KeychainSecureStore!
    var secureStoreWithInternetPwd: KeychainSecureStore!
    
    override func setUp() {
        super.setUp()
        
        let genericPwdQueryable = GenericPasswordQueryable(service: "MyService")
        secureStoreWithGenericPwd = KeychainSecureStore(secureStoreQueryable: genericPwdQueryable)
        
        let internetPwdQueryable = InternetPasswordQueryable(server: "someServer", port: 8080, path: "somePath",
                                                             securityDomain: "someDomain",
                                                             internetProtocol: .https,
                                                             internetAuthenticationType: .httpBasic)
        secureStoreWithInternetPwd = KeychainSecureStore(secureStoreQueryable: internetPwdQueryable)
    }
    
    override func tearDown() {
        try? secureStoreWithGenericPwd.removeAllValues()
        try? secureStoreWithInternetPwd.removeAllValues()
        
        super.tearDown()
    }
    
    func testSaveGenericPassword() throws {
        guard false else {  throw XCTSkip("需要宿主应用测试") }
        do {
            try secureStoreWithGenericPwd.setValue("pwd_1234", for: "genericPassword")
        } catch (let e) {
            XCTFail("Saving generic password failed with \(e.localizedDescription).")
        }
    }
    
    func testReadGenericPassword() throws {
        guard false else {  throw XCTSkip("需要宿主应用测试") }
        do {
            try secureStoreWithGenericPwd.setValue("pwd_1234", for: "genericPassword")
            let password = try secureStoreWithGenericPwd.getValue(for: "genericPassword")
            XCTAssertEqual("pwd_1234", password)
        } catch (let e) {
            XCTFail("Reading generic password failed with \(e.localizedDescription).")
        }
    }
    
    func testUpdateGenericPassword() throws {
        guard false else {  throw XCTSkip("需要宿主应用测试") }
        do {
            try secureStoreWithGenericPwd.setValue("pwd_1234", for: "genericPassword")
            try secureStoreWithGenericPwd.setValue("pwd_1235", for: "genericPassword")
            let password = try secureStoreWithGenericPwd.getValue(for: "genericPassword")
            XCTAssertEqual("pwd_1235", password)
        } catch (let e) {
            XCTFail("Updating generic password failed with \(e.localizedDescription).")
        }
    }
    
    func testRemoveGenericPassword() throws {
        guard false else {  throw XCTSkip("需要宿主应用测试") }
        do {
            try secureStoreWithGenericPwd.setValue("pwd_1234", for: "genericPassword")
            try secureStoreWithGenericPwd.removeValue(for: "genericPassword")
            XCTAssertNil(try secureStoreWithGenericPwd.getValue(for: "genericPassword"))
        } catch (let e) {
            XCTFail("Saving generic password failed with \(e.localizedDescription).")
        }
    }
    
    func testRemoveAllGenericPasswords() throws {
        guard false else {  throw XCTSkip("需要宿主应用测试") }
        do {
            try secureStoreWithGenericPwd.setValue("pwd_1234", for: "genericPassword")
            try secureStoreWithGenericPwd.setValue("pwd_1235", for: "genericPassword2")
            try secureStoreWithGenericPwd.removeAllValues()
            XCTAssertNil(try secureStoreWithGenericPwd.getValue(for: "genericPassword"))
            XCTAssertNil(try secureStoreWithGenericPwd.getValue(for: "genericPassword2"))
        } catch (let e) {
            XCTFail("Removing generic passwords failed with \(e.localizedDescription).")
        }
    }
    
    func testSaveInternetPassword() throws {
        guard false else {  throw XCTSkip("需要宿主应用测试") }
        do {
            try secureStoreWithInternetPwd.setValue("pwd_1234", for: "internetPassword")
        } catch (let e) {
            XCTFail("Saving Internet password failed with \(e.localizedDescription).")
        }
    }
    
    func testReadInternetPassword() throws {
        guard false else {  throw XCTSkip("需要宿主应用测试") }
        do {
            try secureStoreWithInternetPwd.setValue("pwd_1234", for: "internetPassword")
            let password = try secureStoreWithInternetPwd.getValue(for: "internetPassword")
            XCTAssertEqual("pwd_1234", password)
        } catch (let e) {
            XCTFail("Reading Internet password failed with \(e.localizedDescription).")
        }
    }
    
    func testUpdateInternetPassword() throws {
        guard false else {  throw XCTSkip("需要宿主应用测试") }
        do {
            try secureStoreWithInternetPwd.setValue("pwd_1234", for: "internetPassword")
            try secureStoreWithInternetPwd.setValue("pwd_1235", for: "internetPassword")
            let password = try secureStoreWithInternetPwd.getValue(for: "internetPassword")
            XCTAssertEqual("pwd_1235", password)
        } catch (let e) {
            XCTFail("Updating Internet password failed with \(e.localizedDescription).")
        }
    }
    
    func testRemoveInternetPassword() throws {
        guard false else {  throw XCTSkip("需要宿主应用测试") }
        do {
            try secureStoreWithInternetPwd.setValue("pwd_1234", for: "internetPassword")
            try secureStoreWithInternetPwd.removeValue(for: "internetPassword")
            XCTAssertNil(try secureStoreWithInternetPwd.getValue(for: "internetPassword"))
        } catch (let e) {
            XCTFail("Removing Internet password failed with \(e.localizedDescription).")
        }
    }
    
    func testRemoveAllInternetPasswords() throws {
        guard false else {  throw XCTSkip("需要宿主应用测试") }
        do {
            try secureStoreWithInternetPwd.setValue("pwd_1234", for: "internetPassword")
            try secureStoreWithInternetPwd.setValue("pwd_1235", for: "internetPassword2")
            try secureStoreWithInternetPwd.removeAllValues()
            XCTAssertNil(try secureStoreWithInternetPwd.getValue(for: "internetPassword"))
            XCTAssertNil(try secureStoreWithInternetPwd.getValue(for: "internetPassword2"))
        } catch (let e) {
            XCTFail("Removing Internet passwords failed with \(e.localizedDescription).")
        }
    }
}
