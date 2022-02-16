import XCTest
@_exported @testable import Skywalker
@_exported @testable import SkywalkerOC

final class SkywalkerTests: XCTestCase {
    func testExample() throws {
        let nsstring: NSString = NSString.init(stringLiteral: "FF")
        let nsstringData = nsstring.hexData() as NSData
        
        XCTAssertEqual(nsstringData.hexString(), "ff")
        XCTAssertEqual(nsstringData.decimalValue(), 255)
        
    }
}
