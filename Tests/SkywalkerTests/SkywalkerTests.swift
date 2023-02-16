@testable import Skywalker
@testable import SkywalkerOC
import XCTest

final class SkywalkerTests: XCTestCase {
    func testExample() throws {
        let nsstring = NSString(stringLiteral: "FF")
        let nsstringData = nsstring.hexData() as NSData

        XCTAssertEqual(nsstringData.lowercaseHexString(), "ff")
        XCTAssertEqual(nsstringData.decimalValue(), 255)
    }
}
