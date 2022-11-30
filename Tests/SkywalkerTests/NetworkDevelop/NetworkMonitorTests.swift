//
//  NetworkMonitorTests.swift
//  
//
//  Created by 杨俊艺 on 2022/2/22.
//

import XCTest
@testable import Skywalker

class NetworkMonitorTests: XCTestCase {
    
    func testExample() throws {
        NotificationCenter.default.addObserver(self, selector: #selector(showOfflineDeviceUI(notification:)), name: NSNotification.Name.connectivityStatus, object: nil)
    }
    
    @objc func showOfflineDeviceUI(notification: Notification) {
        if NetworkMonitor.shared.isConnected {
            print("Skywalker Network Connected")
        } else {
            print("Skywalker Not Network Connected")
        }
    }
}
