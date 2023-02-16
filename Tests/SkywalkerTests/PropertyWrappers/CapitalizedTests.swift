//
//  CapitalizedTests.swift
//
//
//  Created by 杨俊艺 on 2022/12/14.
//

@testable import Skywalker
import XCTest

private struct People {
    @Capitalized var name: String
}

final class CapitalizedTests: XCTestCase {
    func testExample() throws {
        var p = People(name: "ss")
        XCTAssertEqual(p.name, "Ss")

        p.name = "cc"
        XCTAssertEqual(p.name, "Cc")
    }
}
