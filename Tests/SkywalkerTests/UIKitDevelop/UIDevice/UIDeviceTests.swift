//
//  UIDeviceTests.swift
//  
//
//  Created by 杨俊艺 on 2022/2/16.
//

import XCTest

class UIDeviceTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
        XCTAssertFalse(UIDevice.isIPad())
    }

    func testPerformanceExample() throws {
        self.measure {
            
        }
    }

}
