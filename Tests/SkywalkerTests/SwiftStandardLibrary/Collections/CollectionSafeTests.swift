//
//  CollectionSafeTests.swift
//
//
//  Created by 杨俊艺 on 2022/12/26.
//

import XCTest

final class CollectionSafeTests: XCTestCase {
    func testExample() throws {
        let array = [0, 1, 2]

        if let number = array[safe: 1] {
            XCTAssertEqual(number, 1)
        } else {
            XCTAssertNil(array[safe: 1])
        }

        if let number = array[safe: 4] {
            XCTAssertEqual(number, 4)
        } else {
            XCTAssertNil(array[safe: 4])
        }
    }

    func testNilRemoved() throws {
        let optionals = [1, 2, nil, 3, nil, 4]
        XCTAssertEqual(optionals.nilValuesRemoved().count, 4)
        XCTAssertEqual(optionals.nilValuesRemoved(), [1, 2, 3, 4])
    }
}
