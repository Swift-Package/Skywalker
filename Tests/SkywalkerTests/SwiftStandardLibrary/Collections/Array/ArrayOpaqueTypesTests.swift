//
//  ArrayOpaqueTypesTests.swift
//
//
//  Created by 杨俊艺 on 2022/12/14.
//

import XCTest

final class ArrayOpaqueTypesTests: XCTestCase {
    func testExample() throws {
        let ss = ["1", "2", "3x", "4"].transformToInts()
        for i in ss {
            print(i)
        }

        XCTAssertTrue(ss.contains(where: { element in
            element as! Int == 5
        }))
    }
}
