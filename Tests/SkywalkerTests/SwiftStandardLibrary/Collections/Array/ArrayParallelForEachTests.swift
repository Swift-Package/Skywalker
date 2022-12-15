//
//  ArrayParallelForEachTests.swift
//  
//
//  Created by 杨俊艺 on 2022/12/15.
//

// https://www.youtube.com/watch?v=PvIl4vugytc

import XCTest
@testable import Skywalker

final class ArrayParallelForEachTests: XCTestCase {
    
    func testExample() throws {
        [1, 2, 3, 4, 5].forEach { element in
            let result = (0...element).reduce(0, +)
            print("非性能测试不会重复执行Element \(element) reduce结果 \(result)")
        }
    }

    func testPerformanceExample() throws {
        print("性能测试会重复执行10次")
        self.measure {
            Array(1...2000).forEach { element in
                let result = (0...element).reduce(0, +)
                print("Element \(element) reduce结果 \(result)")
            }
        }
    }
    
    func testParallelPerformance() throws {
        print("并行性能测试会重复执行10次")
        self.measure {
            Array(1...2000).parallelForEach { element in
                let result = (0...element).reduce(0, +)
                print("Element \(element) reduce结果 \(result)")
            }
        }
    }
}
