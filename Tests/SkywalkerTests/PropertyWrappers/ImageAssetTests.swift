//
//  ImageAssetTests.swift
//  
//
//  Created by 杨俊艺 on 2022/12/14.
//

import XCTest
@testable import Skywalker

fileprivate enum Asset {
    @ImageAsset(key: "Skywalker")
    public static var skywalkerIcon: UIImage
}

final class ImageAssetTests: XCTestCase {
    
    func testExample() throws {
        let image = UIImage(named: "Skywalker", in: Bundle.module, with: nil)
        XCTAssertNotNil(image)
        XCTAssertNotNil(Asset.skywalkerIcon)
    }
}
