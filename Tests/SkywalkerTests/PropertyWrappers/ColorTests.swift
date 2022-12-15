//
//  ColorTests.swift
//  
//
//  Created by 杨俊艺 on 2022/12/15.
//

import XCTest
@testable import Skywalker

fileprivate enum Colors {
    @ColorWrapper(dark: .black, light: .red)
    static var mainRed
}

final class ColorTests: XCTestCase {
    
    func testExample() throws {
        XCTAssertEqual(Colors.mainRed, UIColor.red)
        
        // 不管设备外观如何都访问需要的确切的颜色
        XCTAssertEqual(Colors.$mainRed.isDark, false)
        XCTAssertEqual(Colors.$mainRed.light, UIColor.red)
        XCTAssertEqual(Colors.$mainRed.dark, UIColor.black)
    }
}
