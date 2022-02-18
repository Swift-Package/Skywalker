//
//  SwiftLogger.swift
//  
//
//  Created by 杨俊艺 on 2022/2/15.
//

import Foundation
import os

private let subsystem = Bundle.main.bundleIdentifier!

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
    static let pointsOfInterest = OSLog.init(subsystem: subsystem, category: OSLog.Category.pointsOfInterest)
    static let network          = OSLog.init(subsystem: subsystem, category: "NetWork")
    static let MQTT             = OSLog.init(subsystem: subsystem, category: "MQTT")
    static let Bluetooth        = OSLog.init(subsystem: subsystem, category: "Bluetooth")
    static let UIViewContrllerLife  = OSLog.init(subsystem: subsystem, category: "UIViewContrllerLife")
}

// MARK: - 日志记录工具类
@objcMembers
public final class SwiftLogger: NSObject {
    
    public static let shared = SwiftLogger.init()
    
    /// 记录网络日志
    /// - Parameter message: 日志
    public func logNetwork(_ message: String) {
        os_log("%{public}s", log: Log.network, type: .info, message)
    }
    
    /// 记录网络日志
    /// - Parameters:
    ///   - message: 日志
    ///   - type: 日志级别
    public func logNetwork(_ message: String, type: OSLogType) {
        os_log("%{public}s", log: Log.network, type: type, message)
    }
    
    /// 记录MQTT日志
    /// - Parameter message: 日志
    public func logMQTT(_ message: String) {
        os_log("%{public}s", log: Log.MQTT, type: .info, message)
    }
    
    /// 添加不持久化的调试日志
    /// - Parameters:
    ///   - message: 日志字符串
    ///   - log: 默认default即不持久化
    ///   - type: 默认default即不持久化
    public func log(_ message: String, log: OSLog = .default, type: OSLogType = .default) {
        os_log("调试日志%{public}s", log: log, type: .info, message)
    }
    
}

// MARK: - 路标事件跟踪工具类
@objcMembers
public final class SwiftSignposter: NSObject {
    
    public static let shared = SwiftSignposter.init()
    
    private let timeFormatter = DateFormatter.init().then { make in
        make.dateFormat = "yyyy-MM-dd' 'HH:mm:ss.SSSS"
    }
    
    /// Get网络请求消耗衡量
    /// - Parameters:
    ///   - url: 请求URL
    ///   - time: 传入时间对象这个时间对象需要与signpostNetworkEndGetWith的一致
    public func signpostNetworkBeginGetWith(url: String, time: Date) {
        let timeStr = timeFormatter.string(from: time)
        let timeAndURLStamp = timeStr.appending(url)
        
        let signpostID = OSSignpostID.init(log: Log.network, object: NSString.init(string: timeAndURLStamp))
        os_signpost(.begin, log: Log.network, name: "网络路标持续事件跟踪Get", signpostID: signpostID)
    }
    
    public func signpostNetworkEndGetWith(url: String, time: Date) {
        let timeStr = timeFormatter.string(from: time)
        let timeAndURLStamp = timeStr.appending(url)
        
        let signpostID = OSSignpostID.init(log: Log.network, object: NSString.init(string: timeAndURLStamp))
        os_signpost(.end, log: Log.network, name: "网络路标持续事件跟踪Get", signpostID: signpostID, "URL---->%{public}s", url)
    }
    
    /// Post网络请求消耗衡量
    /// - Parameters:
    ///   - url: 请求URL
    ///   - time: 传入时间对象这个时间对象需要与signpostNetworkEndGetWith的一致
    public func signpostNetworkBeginPostWith(url: String, time: Date) {
        let timeStr = timeFormatter.string(from: time)
        let timeAndURLStamp = timeStr.appending(url)
        
        let signpostID = OSSignpostID.init(log: Log.network, object: NSString.init(string: timeAndURLStamp))
        os_signpost(.begin, log: Log.network, name: "网络路标持续事件跟踪Post", signpostID: signpostID)
    }
    
    public func signpostNetworkEndPostWith(url: String, time: Date) {
        let timeStr = timeFormatter.string(from: time)
        let timeAndURLStamp = timeStr.appending(url)
        
        let signpostID = OSSignpostID.init(log: Log.network, object: NSString.init(string: timeAndURLStamp))
        os_signpost(.end, log: Log.network, name: "网络路标持续事件跟踪Post", signpostID: signpostID, "URL---->%{public}s", url)
    }
    
    /// 性能路标时间消耗衡量
    /// - Parameter id: 一串尽可能不重复的数字去跟踪你要的性能路标持续事件
    public func signpostPerformanceBeginWith(id: UInt64) {
        os_signpost(.begin, log: Log.pointsOfInterest, name: "性能路标持续事件跟踪", signpostID: OSSignpostID.init(id), "ID%{public}s", "\(id)")
    }
    
    public func signpostPerformanceEndWith(id: UInt64) {
        os_signpost(.end, log: Log.pointsOfInterest, name: "性能路标持续事件跟踪", signpostID: OSSignpostID.init(id), "ID%{public}s", "\(id)")
    }
    
    /// 自定义路标瞬时事件发生
    /// - Parameter id: 一串尽可能不重复的数字去跟踪你要的瞬时事件
    public func signpostEventWith(id: UInt64) {
        os_signpost(.event, log: Log.pointsOfInterest, name: "自定义路标瞬时事件发生", signpostID: OSSignpostID.init(id), "ID%{public}s", "\(id)")
    }
    
    /// 自定义路标持续事件跟踪
    /// - Parameter id: 一串尽可能不重复的数字去跟踪你要的路标事件
    public func signpostBeginWith(id: UInt64) {
        os_signpost(.begin, log: Log.pointsOfInterest, name: "自定义路标持续事件跟踪", signpostID: OSSignpostID.init(id), "ID%{public}s", "\(id)")
    }
    
    public func signpostEndWith(id: UInt64) {
        os_signpost(.end, log: Log.pointsOfInterest, name: "自定义路标持续事件跟踪", signpostID: OSSignpostID.init(id))
    }
    
}
