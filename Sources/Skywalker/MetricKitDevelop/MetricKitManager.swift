//
//  MetricKitManager.swift
//  
//
//  Created by 杨俊艺 on 2022/10/29.
//

import MetricKit

public class MetricKitManager: NSObject {
    
    public static let shared = MetricKitManager.init()
    
    private override init() {
        super.init()
    }
    
    deinit { MXMetricManager.shared.remove(self) }
    
    /// 启动MetricKit性能监控
    public func startMonitor() {
        MXMetricManager.shared.add(self)
        
        let metricLogHandle = MXMetricManager.makeLogHandle(category: "Skywalker")
        mxSignpost(.event, log: metricLogHandle, name: "Skywalker 启动性能检测")
    }
}

extension MetricKitManager: MXMetricManagerSubscriber {
    
    public func didReceive(_ payloads: [MXMetricPayload]) {
        guard let firstPayload = payloads.first else { return }
        print("Skywalker \(firstPayload.dictionaryRepresentation())")
    }
    
    public func didReceive(_ payloads: [MXDiagnosticPayload]) {
        guard let firstPayload = payloads.first else { return }
        print("Skywalker \(firstPayload.dictionaryRepresentation())")
    }
}
