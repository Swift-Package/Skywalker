//
//  IntConvertTests.swift
//
//
//  Created by 杨俊艺 on 2022/2/21.
//

@testable import Skywalker
import XCTest

class IntConvertTests: XCTestCase {
    func testExample() throws {
        let result = 5.romanNumeral
        XCTAssertEqual(result, "V", "转换5为罗马数字失败")
    }
}
