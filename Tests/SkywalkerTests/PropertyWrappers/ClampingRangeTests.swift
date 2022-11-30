//
//  ClampingRangeTests.swift
//  
//
//  Created by 杨俊艺 on 2022/4/19.
//

import XCTest
@testable import Skywalker

struct Solution {
    @ClampingRange(0...14) var pH: Double = 7.0
}

class ClampingRangeTests: XCTestCase {
    
    func testExample() throws {
        let s = Solution.init()
        
        XCTAssertEqual(s.pH, 7)
        
        
        let ss = Solution.init(pH: 6)
        
        XCTAssertEqual(ss.pH, 6)
        
        var sss = Solution.init(pH: 14)
        sss.pH = 99
        XCTAssertEqual(sss.pH, 14)
        
        sss.pH = -4
        XCTAssertEqual(sss.pH, 0)
    }
}
