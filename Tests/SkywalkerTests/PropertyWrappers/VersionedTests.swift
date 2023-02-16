//
//  VersionedTests.swift
//
//
//  Created by 杨俊艺 on 2022/4/19.
//

@testable import Skywalker
import XCTest

class ExpenseReport {
    enum State { case submitted, received, approved, denied }

    @Versioned var state: State = .submitted
}

class VersionedTests: XCTestCase {
    func testExample() throws {
        let testSuit = ExpenseReport()

        testSuit.state = .denied
        testSuit.state = .approved
    }
}
