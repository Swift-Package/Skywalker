//
//  SwiftLogger.swift
//  
//
//  Created by 杨俊艺 on 2022/2/15.
//

import Foundation
import os

private let subsystem = "com.githubyangjunyi.skywalker"

// MARK: - 日志分类
//struct Log {
//    #if Debug
//    static let pointsOfInterest = OSLog.init(subsystem: subsystem, category: .pointsOfInterest)
//    static let network          = OSLog.init(subsystem: subsystem, category: "NetWork")
//    static let MQTT             = OSLog.init(subsystem: subsystem, category: "MQTT")
//    #elseif TestFlight
//    static let pointsOfInterest = OSLog.init(subsystem: subsystem, category: .pointsOfInterest)
//    static let network          = OSLog.init(subsystem: subsystem, category: "NetWork")
//    static let MQTT             = OSLog.init(subsystem: subsystem, category: "MQTT")
//    #elseif Release
//    static let pointsOfInterest = OSLog.disabled
//    static let network          = OSLog.disabled
//    static let MQTT             = OSLog.disabled
//    #endif
//}

// MARK: - 日志分类
struct Log {
    static let pointsOfInterest = OSLog.init(subsystem: subsystem, category: .pointsOfInterest)
    static let network          = OSLog.init(subsystem: subsystem, category: "NetWork")
    static let MQTT             = OSLog.init(subsystem: subsystem, category: "MQTT")
}

// MARK: - 日志记录工具类
@objcMembers
final class SwiftLogger: NSObject {
    
    static let shared = SwiftLogger.init()
    
    func logNetwork(_ message: String) {
        os_log("%{public}s", log: Log.network, type: .info, message)
    }
    
    func logNetwork(_ message: String, type: OSLogType) {
        os_log("%{public}s", log: Log.network, type: type, message)
    }
    
    func logMQTT(_ message: String) {
        os_log("%{public}s", log: Log.MQTT, type: .info, message)
    }
    
    /// 添加不持久化的调试日志
    /// - Parameters:
    ///   - message: 日志字符串
    ///   - log: 默认default即不持久化
    ///   - type: 默认default即不持久化
    func log(_ message: String, log: OSLog = .default, type: OSLogType = .default) {
        os_log("调试日志%{public}s", log: log, type: .info, message)
    }
    
}

// MARK: - 路标事件跟踪工具类
@objcMembers
final class SwiftSignposter: NSObject {
    
    static let shared = SwiftSignposter.init()
    
    // MARK: - Get请求时间消耗衡量
    func signpostNetworkBeginGet() {
        os_signpost(.begin, log: Log.pointsOfInterest, name: "网络路标持续事件跟踪Get")
    }
    
    func signpostNetworkEndGetWith(url: String) {
        os_signpost(.end, log: Log.pointsOfInterest, name: "网络路标持续事件跟踪Get", "URL---->%{public}s", url)
    }
    
    // MARK: - Post请求时间消耗衡量
    func signpostNetworkBeginPost() {
        os_signpost(.begin, log: Log.pointsOfInterest, name: "网络路标持续事件跟踪Post")
    }
    
    func signpostNetworkEndPostWith(url: String) {
        os_signpost(.end, log: Log.pointsOfInterest, name: "网络路标持续事件跟踪Post", "URL---->%{public}s", url)
    }
    
    // MARK: - 性能路标时间消耗衡量
    func signpostPerformanceBeginWith(id: UInt64)  {
        os_signpost(.begin, log: Log.pointsOfInterest, name: "性能路标持续事件跟踪", signpostID: OSSignpostID.init(id), "ID%{public}s", "\(id)")
    }
    
    func signpostPerformanceEndWith(id: UInt64)  {
        os_signpost(.end, log: Log.pointsOfInterest, name: "性能路标持续事件跟踪", signpostID: OSSignpostID.init(id), "ID%{public}s", "\(id)")
    }
    
    // MARK: - 自定义路标瞬时事件发生
    func signpostEventWith(id: UInt64) {
        os_signpost(.event, log: Log.pointsOfInterest, name: "自定义路标瞬时事件发生", signpostID: OSSignpostID.init(id), "ID%{public}s", "\(id)")
    }
    
    // MARK: - 自定义路标持续事件跟踪
    /// 成对调用signpostBeginWith和signpostEndWith
    /// - Parameter id: 一串尽可能不重复的数字去跟踪你要的路标事件
    func signpostBeginWith(id: UInt64) {
        os_signpost(.begin, log: Log.pointsOfInterest, name: "自定义路标持续事件跟踪", signpostID: OSSignpostID.init(id), "ID%{public}s", "\(id)")
    }
    
    func signpostEndWith(id: UInt64) {
        os_signpost(.end, log: Log.pointsOfInterest, name: "自定义路标持续事件跟踪", signpostID: OSSignpostID.init(id))
    }
    
}
