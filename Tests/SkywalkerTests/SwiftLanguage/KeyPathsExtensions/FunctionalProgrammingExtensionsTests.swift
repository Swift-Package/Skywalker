//
//  FunctionalProgrammingExtensionsTests.swift
//  
//
//  Created by 杨俊艺 on 2022/12/14.
//

import XCTest
@testable import Skywalker

fileprivate struct People {
    var age: Int
}

final class FunctionalProgrammingExtensionsTests: XCTestCase {
    
    func testExample() throws {
        let peoples = [People(age: 18), People(age: 16)]
        XCTAssertEqual(peoples.filter(\.age > 18).count, 0)
        XCTAssertEqual(peoples.filter(\.age < 18).count, 1)
        XCTAssertEqual(peoples.filter(\.age >= 18).count, 1)
        XCTAssertEqual(peoples.filter(\.age <= 18).count, 2)
        XCTAssertEqual(peoples.filter(\.age == 18).count, 1)
        XCTAssertEqual(peoples.filter(\.age != 18).count, 1)
    }
}
