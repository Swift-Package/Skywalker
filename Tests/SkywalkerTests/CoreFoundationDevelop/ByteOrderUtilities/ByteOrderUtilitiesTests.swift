//
//  ByteOrderUtilitiesTests.swift
//
//
//  Created by 杨俊艺 on 2022/5/16.
//

import XCTest

/// 测试Core Foundation字节序转换工具函数
class ByteOrderUtilitiesTests: XCTestCase {
    func testExample() throws {
        XCTAssertTrue(CFByteOrderGetCurrent() != 0)

        XCTAssertEqual(CFSwapInt32HostToBig(305_419_896), 2_018_915_346)
        XCTAssertEqual(CFSwapInt32HostToLittle(4_043_309_055), 4_043_309_055)
        XCTAssertEqual(CFSwapInt32HostToBig(4_043_309_055), 4_294_967_280)
        XCTAssertEqual(CFSwapInt32HostToBig(0xF0FF_FFFF), 0xFFFF_FFF0)

        // f0ff ffff
        // ffff fff0
    }
}
