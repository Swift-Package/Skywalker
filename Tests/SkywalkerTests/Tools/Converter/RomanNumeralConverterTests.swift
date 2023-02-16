//
//  RomanNumeralConverterTests.swift
//
//
//  Created by 杨俊艺 on 2022/2/21.
//

@testable import Skywalker
import XCTest

class RomanNumeralConverterTests: XCTestCase {
    let converter = RomanNumeralConverter()

    func testExample() throws {
        let result = converter.convert(1)
        XCTAssertEqual(result, "I", "转换1为罗马数字失败")
    }

    func testConversionForTwo() {
        let result = converter.convert(2)
        XCTAssertEqual(result, "II", "转换2为罗马数字失败")
    }

    func testConversionForFive() {
        let result = converter.convert(5)
        XCTAssertEqual(result, "V", "转换5为罗马数字失败")
    }

    func testConversionForSix() {
        let result = converter.convert(6)
        XCTAssertEqual(result, "VI", "转换6为罗马数字失败")
    }

    func testConversionForTen() {
        let result = converter.convert(10)
        XCTAssertEqual(result, "X", "转换10为罗马数字失败")
    }

    func testConversionForTwenty() {
        let result = converter.convert(20)
        XCTAssertEqual(result, "XX", "转换20为罗马数字失败")
    }

    func testConversionForFour() {
        let result = converter.convert(4)
        XCTAssertEqual(result, "IV", "转换4为罗马数字失败")
    }

    func testConversionForNine() {
        let result = converter.convert(9)
        XCTAssertEqual(result, "IX", "转换9为罗马数字失败")
    }

    func testConverstionForZero() {
        let result = converter.convert(0)
        XCTAssertEqual(result, "", "转换0为罗马数字失败")
    }

    func testConverstionFor3999() {
        let result = converter.convert(3999)
        XCTAssertEqual(result, "MMMCMXCIX", "转换3999为罗马数字失败")
    }
}
