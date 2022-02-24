//
//  NetworkMonitorTests.swift
//  
//
//  Created by 杨俊艺 on 2022/2/22.
//

import XCTest

class NetworkMonitorTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {
        NotificationCenter.default.addObserver(self, selector: #selector(showOfflineDeviceUI(notification:)), name: NSNotification.Name.connectivityStatus, object: nil)
    }

    @objc func showOfflineDeviceUI(notification: Notification) {
        if NetworkMonitor.shared.isConnected {
            print("Connected")
        } else {
            print("Not connected")
        }
    }
    
    func testPerformanceExample() throws {
        self.measure {
            
        }
    }

}
