//
//  NetworkMonitorTests.swift
//
//
//  Created by 杨俊艺 on 2022/2/22.
//

@testable import Skywalker
import XCTest

class NetworkMonitorTests: XCTestCase {
    func testExample() throws {
        NotificationCenter.default.addObserver(self, selector: #selector(showOfflineDeviceUI(notification:)), name: NSNotification.Name.connectivityStatus, object: nil)
    }

    @objc func showOfflineDeviceUI(notification _: Notification) {
        if NetworkMonitor.shared.isConnected {
            print("Skywalker Network Connected")
        } else {
            print("Skywalker Not Network Connected")
        }
    }
}
