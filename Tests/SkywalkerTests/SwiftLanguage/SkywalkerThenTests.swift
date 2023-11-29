//
//  SkywalkerThenTests.swift
//
//
//  Created by 杨俊艺 on 2022/2/17.
//

@testable import Skywalker
import XCTest
import Then

struct User {
    var name: String?
    var email: String?
}

extension User: Then {}

class SkywalkerThenTests: XCTestCase {
    // MARK: - 非引用型使用with

    func testWith() {
        let user = User().with { make in
            make.name = "devxoul"
            make.email = "devxoul@gmail.com"
        }
        XCTAssertEqual(user.name, "devxoul")
        XCTAssertEqual(user.email, "devxoul@gmail.com")
    }

    // MARK: - 所有NSObject子类使用then

    func testThen_NSObject() {
        let queue = OperationQueue().then { make in
            make.name = "awesome"
            make.maxConcurrentOperationCount = 5
        }
        XCTAssertEqual(queue.name, "awesome")
        XCTAssertEqual(queue.maxConcurrentOperationCount, 5)
    }

    func testDo() {
        UserDefaults.standard.do {
            $0.removeObject(forKey: "username")
            $0.set("devxoul", forKey: "username")
            $0.synchronize()
        }
        XCTAssertEqual(UserDefaults.standard.string(forKey: "username"), "devxoul")
    }

    func testWith_Array() {
        let array = [1, 2, 3].with { $0.append(4) }
        XCTAssertEqual(array, [1, 2, 3, 4])
    }

    func testWith_Dictionary() {
        let dict = ["Korea": "Seoul", "Japan": "Tokyo"].with {
            $0["China"] = "Beijing"
        }
        XCTAssertEqual(dict, ["Korea": "Seoul", "Japan": "Tokyo", "China": "Beijing"])
    }

    func testWith_Set() {
        let set = Set(["A", "B", "C"]).with {
            $0.insert("D")
        }
        XCTAssertEqual(set, Set(["A", "B", "C", "D"]))
    }

    // MARK: - 测试错误rethrows

    func testRethrows() {
        XCTAssertThrowsError(
            try NSObject().do { _ in
                throw NSError(domain: "", code: 0)
            }
        )
    }
}
