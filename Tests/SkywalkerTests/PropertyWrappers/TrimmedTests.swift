//
//  TrimmedTests.swift
//
//
//  Created by 杨俊艺 on 2022/4/19.
//

@testable import Skywalker
import XCTest

struct Post {
    @Trimmed var title: String
}

class TrimmedTests: XCTestCase {
    func testExample() throws {
        XCTAssertEqual(Post(title: "cccc").title, "cccc")

        XCTAssertEqual(Post(title: " cccc ").title, "cccc")
    }
}
