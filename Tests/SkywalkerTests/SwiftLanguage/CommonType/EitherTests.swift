//
//  EitherTests.swift
//
//
//  Created by 杨俊艺 on 2022/11/28.
//

@testable import Skywalker
import XCTest

final class EitherTests: XCTestCase {
    func testExample() throws {
        let ei = Either<String, Int>.right(2).map { $0 * $0 }
        print("EitherTests \(ei)")
    }
}
