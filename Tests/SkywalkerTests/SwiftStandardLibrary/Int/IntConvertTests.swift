//
//  IntConvertTests.swift
//  
//
//  Created by 杨俊艺 on 2022/2/21.
//

import XCTest

class IntConvertTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
        let result = 5.romanNumeral
        XCTAssertEqual(result, "V", "转换5为罗马数字失败")
    }

    func testPerformanceExample() throws {
        self.measure {
            
        }
    }

}
