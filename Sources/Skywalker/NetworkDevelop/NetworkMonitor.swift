//
//  File.swift
//  
//
//  Created by 杨俊艺 on 2022/2/22.
//

import Network

/// 网络状态监听类
class NetworkMonitor {
    static let shared = NetworkMonitor()
  
    private let monitor = NWPathMonitor()
    private var status = NWPath.Status.requiresConnection
  
    var isReachable: Bool {
        status == .satisfied
    }

    private init() {
        startMonitoring()
    }

    func startMonitoring() {
        let queue = DispatchQueue(label: "NetworkMonitor")
        
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
        }
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
    
}
