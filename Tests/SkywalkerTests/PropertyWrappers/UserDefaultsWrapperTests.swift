//
//  UserDefaultsWrapperTests.swift
//  
//
//  Created by 杨俊艺 on 2022/3/13.
//

import XCTest
@testable import Skywalker

class UserDefaultsWrapperTests: XCTestCase {
    
    @UserDefault("USES_TOUCH_ID", defaultValue: true)
    static var usesTouchID: Bool
    
    override func tearDownWithError() throws {
        UserDefaults.standard.set(true, forKey: "USES_TOUCH_ID")
    }
    
    func testExample() throws {
        XCTAssertEqual(UserDefaults.standard.bool(forKey: "USES_TOUCH_ID"), true)
        XCTAssertEqual(UserDefaultsWrapperTests.usesTouchID, true)
        UserDefaultsWrapperTests.usesTouchID = false
        XCTAssertEqual(UserDefaultsWrapperTests.usesTouchID, false)
    }
}
