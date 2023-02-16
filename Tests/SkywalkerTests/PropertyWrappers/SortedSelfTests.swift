//
//  SortedSelfTests.swift
//
//
//  Created by 杨俊艺 on 2022/5/4.
//

@testable import Skywalker
import XCTest

struct Person {
    let firstName: String
    let lastName: String
    let age: Int
}

class SortedSelfTests: XCTestCase {
    func testExample() throws {
        @SortedSelf(by: \.age) var people = [
            Person(firstName: "A", lastName: "A", age: 12),
            Person(firstName: "B", lastName: "B", age: 4),
            Person(firstName: "V", lastName: "V", age: 2),
            Person(firstName: "C", lastName: "C", age: 3),
        ]

        XCTAssertEqual(people[0].age, 2)

        people.append(Person(firstName: "X", lastName: "X", age: 1))
        XCTAssertEqual(people[0].age, 1)
    }
}
