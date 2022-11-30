//
//  TrimmedTests.swift
//  
//
//  Created by 杨俊艺 on 2022/4/19.
//

import XCTest
@testable import Skywalker

struct Post {
    @Trimmed var title: String
}

class TrimmedTests: XCTestCase {
    
    func testExample() throws {
        XCTAssertEqual(Post.init(title: "cccc").title, "cccc")
        
        XCTAssertEqual(Post.init(title: " cccc ").title, "cccc")
    }
}
