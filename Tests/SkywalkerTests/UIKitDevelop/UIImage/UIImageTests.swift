//
//  UIImageTests.swift
//
//
//  Created by 杨俊艺 on 2022/2/16.
//

@testable import Skywalker
@testable import SkywalkerOC
import XCTest

class UIImageTests: XCTestCase {
    func testExample() throws {
        let ii = UIImage()
        ii.convertToGray()
        ii.color(atPixel: CGPoint.zero)
    }
}
