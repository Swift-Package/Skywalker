//
//  SwiftLoggerTests.swift
//  
//
//  Created by 杨俊艺 on 2022/2/18.
//

import XCTest

class SwiftLoggerTests: XCTestCase {

    private let timeFormatter = DateFormatter.init().then { make in
        make.dateFormat = "yyyy-MM-dd' 'HH:mm:ss.SSSS"
    }
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
        
        var time = Date.init()
        var timeStr = timeFormatter.string(from: time)
        var timeAndURLStamp = timeStr.appending("cc")

        SwiftSignposter.shared.signpostNetworkGetBeginWith(url: "cc", timeAndURLStamp: timeAndURLStamp as NSString)
        for _ in 0...10000 {
            for _ in 0...1000 {
                print("c")
            }
        }
        SwiftSignposter.shared.signpostNetworkGetEndWith(url: "cc", timeAndURLStamp: timeAndURLStamp as NSString)


        time = Date.init()
        timeStr = timeFormatter.string(from: time)
        timeAndURLStamp = timeStr.appending("aa")

        SwiftSignposter.shared.signpostNetworkPostBeginWith(url: "pp", timeAndURLStamp: timeAndURLStamp as NSString)
        for _ in 0...10000 {
            for _ in 0...1000 {
                print("c")
            }
        }
        SwiftSignposter.shared.signpostNetworkPostEndWith(url: "pp", timeAndURLStamp: timeAndURLStamp as NSString)

        SwiftSignposter.shared.signpostFlashEventWith(id: 888)


        time = Date.init()
        timeStr = timeFormatter.string(from: time)
        timeAndURLStamp = timeStr.appending("aa")

        SwiftSignposter.shared.signpostNetworkGetBeginWith(url: "aa", timeAndURLStamp: timeAndURLStamp as NSString)
        for _ in 0...10000 {
            for _ in 0...1000 {
                print("c")
            }
        }
        SwiftSignposter.shared.signpostNetworkGetEndWith(url: "aa", timeAndURLStamp: timeAndURLStamp as NSString)

        SwiftSignposter.shared.signpostFlashEventWith(id: 666)



        SwiftSignposter.shared.signpostBeginWith(id: 123)
        for _ in 0...10000 {
            for _ in 0...1000 {
                print("c")
            }
        }
        SwiftSignposter.shared.signpostEndWith(id: 123)


        SwiftSignposter.shared.signpostFlashEventWith(id: 777)

        
    }

    func testPerformanceExample() throws {
        self.measure {
            
        }
    }

}
