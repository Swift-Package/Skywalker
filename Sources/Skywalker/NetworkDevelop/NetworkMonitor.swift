//
//  File.swift
//
//
//  Created by 杨俊艺 on 2022/2/22.
//

import Foundation
import Network

extension NWInterface.InterfaceType: CaseIterable {
    public static var allCases: [NWInterface.InterfaceType] = [.other, .wifi, .cellular, .loopback, .wiredEthernet]
}

public extension Notification.Name {
    static let connectivityStatus = Notification.Name(rawValue: "connectivityStatusChanged")
}

/// 网络状态监听类 使用时在didFinishLaunchingWithOptions方法内NetworkMonitor.shared.startMonitoring()
@objc
public final class NetworkMonitor: NSObject {
    public static let shared = NetworkMonitor()

    private let monitor: NWPathMonitor
    private var status = NWPath.Status.requiresConnection
    private let queue = DispatchQueue(label: "NetworkConnectivityMonitor")

    public private(set) var isConnected = false
    public private(set) var isExpensive = false
    public private(set) var currentConnectionType: NWInterface.InterfaceType? // 网络类型

    public var isReachable: Bool {
        status == .satisfied
    }

    override private init() {
        monitor = NWPathMonitor()
        super.init()
    }

    public func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
            self?.isConnected = path.status != .unsatisfied
            self?.isExpensive = path.isExpensive
            self?.currentConnectionType = NWInterface.InterfaceType.allCases.filter { path.usesInterfaceType($0) }.first

            NotificationCenter.default.post(name: .connectivityStatus, object: nil)
        }
        monitor.start(queue: queue)
    }

    public func stopMonitoring() {
        monitor.cancel()
    }
}
