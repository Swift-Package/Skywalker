//
//  UserDefaultsWrapperTests.swift
//  
//
//  Created by 杨俊艺 on 2022/3/13.
//

import XCTest
@testable import Skywalker

fileprivate class Note: Codable {
    
}

fileprivate class UserDefaultsDataSource {
    @UserDefault("is_first_launch", defaultValue: true)
    static var isFirstLaunch: Bool
    
    @UserDefault(storage: .standard, "counter", defaultValue: 1)
    static var counter: Int
    
    @UserDefaultCodable(key: "notes", defaultValue: nil)
    static var notes: [Note]?
    
}

class UserDefaultsWrapperTests: XCTestCase {
    
    func testExample() throws {
        XCTAssertEqual(UserDefaultsDataSource.isFirstLaunch, true)
        XCTAssertEqual(UserDefaults.standard.bool(forKey: "is_first_launch"), true)
        
        XCTAssertEqual(UserDefaultsDataSource.counter, 1)
        XCTAssertEqual(UserDefaults.standard.value(forKey: "counter") as! Int, 1)
        
        XCTAssertNil(UserDefaultsDataSource.notes)
        XCTAssertNil(UserDefaults.standard.value(forKey: "notes"))
        
        
    }
}
