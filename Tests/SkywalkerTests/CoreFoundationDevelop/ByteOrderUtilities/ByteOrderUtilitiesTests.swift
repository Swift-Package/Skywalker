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
        XCTAssertTrue((CFByteOrderGetCurrent() != 0))
        
        XCTAssertEqual(CFSwapInt32HostToBig(305419896), 2018915346)
        XCTAssertEqual(CFSwapInt32HostToLittle(4043309055), 4043309055)
        XCTAssertEqual(CFSwapInt32HostToBig(4043309055), 4294967280)
        XCTAssertEqual(CFSwapInt32HostToBig(0xf0ffffff), 0xfffffff0)
        
        
        //f0ff ffff
        
        //ffff fff0
    }

}
