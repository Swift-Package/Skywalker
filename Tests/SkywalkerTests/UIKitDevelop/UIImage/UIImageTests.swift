//
//  UIImageTests.swift
//  
//
//  Created by 杨俊艺 on 2022/2/16.
//

import XCTest
import SkywalkerOC

class UIImageTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
        let ii = UIImage.init()
        ii.convertToGray()
        ii.color(atPixel: CGPoint.zero)
        
    }

    func testPerformanceExample() throws {
        self.measure {
            
        }
    }

}
