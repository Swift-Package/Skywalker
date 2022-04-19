import XCTest
@testable import Skywalker
@testable import SkywalkerOC

final class SkywalkerTests: XCTestCase {
    func testExample() throws {
        let nsstring: NSString = NSString.init(stringLiteral: "FF")
        let nsstringData = nsstring.hexData() as NSData
        
        XCTAssertEqual(nsstringData.lowercaseHexString(), "ff")
        XCTAssertEqual(nsstringData.decimalValue(), 255)
        
    }
}
