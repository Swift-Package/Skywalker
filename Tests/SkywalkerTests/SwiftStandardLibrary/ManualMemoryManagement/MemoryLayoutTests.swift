//
//  MemoryLayoutTests.swift
//  
//
//  Created by 杨俊艺 on 2022/6/1.
//

import XCTest

class MemoryLayoutTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
        let version: [UInt8] = [0, 0, 0]
        XCTAssertEqual(MemoryLayout.size(ofValue: version), 8)
        XCTAssertEqual(MemoryLayout<UInt8>.size, 1)
        XCTAssertEqual(MemoryLayout<[UInt8]>.size, 8)
        XCTAssertEqual(MemoryLayout.size(ofValue: [0, 0, 0]), 8)
        
    }

}
