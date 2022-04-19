//
//  NSStringConvertTests.swift
//  
//
//  Created by 杨俊艺 on 2022/3/22.
//

import XCTest
@testable import SkywalkerOC

class NSStringConvertTests: XCTestCase {
    
    func testMD5() throws {
        
        XCTAssertEqual(NSString.init(stringLiteral: "yangjunyi").md5(), "24ab75944eb17a62fbd86fd5a172b814")
        XCTAssertEqual(NSString.init(stringLiteral: "githubyangjunyi").md5(), "8d4ad092de7f7aaa343ee561e57ac241")
        
    }

    func testBase64() throws {
        
        XCTAssertEqual(NSString.init(stringLiteral: "yangjunyi").base64(), "eWFuZ2p1bnlp")
        XCTAssertEqual(NSString.init(stringLiteral: "githubyangjunyi").base64(), "Z2l0aHVieWFuZ2p1bnlp")
        
        
        XCTAssertEqual(NSString.init(stringLiteral: "eWFuZ2p1bnlp").base64ToOriginal(), "yangjunyi")
        XCTAssertEqual(NSString.init(stringLiteral: "Z2l0aHVieWFuZ2p1bnlp").base64ToOriginal(), "githubyangjunyi")
        
    }

    func testJsonString() throws {
        
        
    }
    
}
