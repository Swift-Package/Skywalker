//
//  StringSplitTests.swift
//  
//
//  Created by 杨俊艺 on 2022/5/24.
//

import XCTest

class StringSplitTests: XCTestCase {
    
    func testExample() throws {
        XCTAssertEqual("ccaadd".split(by: 2).count, 3)
        XCTAssertEqual("ccaadd".split(by: 2).first, "cc")
        XCTAssertEqual("ccaadd".split(by: 2).last, "dd")
        
        
        XCTAssertEqual("ccaadd".split(by: 4).count, 2)
        XCTAssertEqual("ccaadd".split(by: 4).first, "ccaa")
        XCTAssertEqual("ccaadd".split(by: 4).last, "dd")
        
        
        
        XCTAssertEqual("ccaadd".split(by: 3).count, 2)
        XCTAssertEqual("ccaadd".split(by: 3).first, "cca")
        XCTAssertEqual("ccaadd".split(by: 3).last, "add")
    }
}
