//
//  UIImageTests.swift
//  
//
//  Created by 杨俊艺 on 2022/2/16.
//

import XCTest
@testable import Skywalker
@testable import SkywalkerOC

class UIImageTests: XCTestCase {
    
    func testExample() throws {
        let ii = UIImage.init()
        ii.convertToGray()
        ii.color(atPixel: CGPoint.zero)
    }
}
