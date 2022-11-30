//
//  StringLocalizedTests.swift
//  
//
//  Created by 杨俊艺 on 2022/4/2.
//

import XCTest
@testable import Skywalker

class StringLocalizedTests: XCTestCase {
    
    func testExample() throws {
        // ⚠️这个包的默认语言是zh但是Scheme的Test动作是Debug配置Options的App Language为System Language是英语
        XCTAssertEqual("Roll".localized(), "Roll")
        
        XCTAssertEqual("摇晃".localized(), "Roll")
        
        // XCTAssertEqual("摇晃".localized(), "摇晃晃")// 测试App Language为中文的情况下
    }
}
