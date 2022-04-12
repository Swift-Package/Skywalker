//
//  NetworkMonitorForSwiftUI.swift
//  
//
//  Created by 杨俊艺 on 2022/2/23.
//

import Foundation
import Network

public class NetworkMonitorForSwiftUI: ObservableObject {
    static let shared = NetworkMonitorForSwiftUI()
    
    private let monitor: NWPathMonitor
    private let queue = DispatchQueue.init(label: "NetworkConnectivityMonitor")
    
    @Published var currentInterface: NWInterface.InterfaceType = .wifi
    
    private init() {
        monitor = NWPathMonitor.init()
    }
    
    public func start() {
        monitor.pathUpdateHandler = { path in
            guard let interface = NWInterface.InterfaceType.allCases.filter({ interFaceType in path.usesInterfaceType(interFaceType) }).first else { return }
            
            DispatchQueue.main.sync { [weak self] in
                self?.currentInterface = interface
            }
        }
        
        monitor.start(queue: queue)
    }
    
    public func stop() {
        monitor.cancel()
    }
    
}
