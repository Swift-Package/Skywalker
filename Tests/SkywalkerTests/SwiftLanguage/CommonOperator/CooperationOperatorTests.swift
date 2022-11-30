//
//  CooperationOperatorTests.swift
//  
//
//  Created by 杨俊艺 on 2022/11/28.
//

import XCTest
@testable import Skywalker

final class CooperationOperatorTests: XCTestCase {
    func testExample() throws {
        func incr(x: Int) -> Int { return x + 1 }
        func squ(x: Int) -> Int { return x * x }
        
        let function = (incr >>> squ) >>> incr
        let result = Array(1...10).map(function)
        print(result)
    }
}
