//
//  UIDeviceTests.swift
//
//
//  Created by 杨俊艺 on 2022/2/16.
//

@testable import Skywalker
import XCTest

class UIDeviceTests: XCTestCase {
    func testExample() throws {
        XCTAssertFalse(UIDevice.isIPad())
    }
}
