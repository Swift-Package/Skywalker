//
//  CapitalizedTests.swift
//  
//
//  Created by 杨俊艺 on 2022/12/14.
//

import XCTest
@testable import Skywalker

fileprivate struct People {
    @Capitalized var name: String
}

final class CapitalizedTests: XCTestCase {
    
    func testExample() throws {
        var p = People.init(name: "ss")
        XCTAssertEqual(p.name, "Ss")
        
        p.name = "cc"
        XCTAssertEqual(p.name, "Cc")
    }
}
