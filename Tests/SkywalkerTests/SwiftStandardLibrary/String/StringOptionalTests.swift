//
//  StringOptionalTests.swift
//  
//
//  Created by 杨俊艺 on 2023/1/6.
//

import XCTest

final class StringOptionalTests: XCTestCase {
    
    func testExample() throws {
        var nilString: String?
        
        XCTAssertEqual(nilString.orEmpty, "")
        XCTAssertEqual(nilString.isNilOrEmpty, true)
        
        nilString = ""
    }
}
