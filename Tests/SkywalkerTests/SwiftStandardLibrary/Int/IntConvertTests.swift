//
//  IntConvertTests.swift
//  
//
//  Created by 杨俊艺 on 2022/2/21.
//

import XCTest
@testable import Skywalker

class IntConvertTests: XCTestCase {
    
    func testExample() throws {
        let result = 5.romanNumeral
        XCTAssertEqual(result, "V", "转换5为罗马数字失败")
    }
}
