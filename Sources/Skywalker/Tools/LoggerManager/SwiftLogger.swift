//
//  SwiftLogger.swift
//  
//
//  Created by 杨俊艺 on 2022/2/15.
//

import os
import Foundation

// MARK: - 日志分类
private let subsystem = Bundle.main.bundleIdentifier!

struct Log {
//    #if PACKAGECONFIGURATION_RELEASE
//    static let PointsOfInterest     = OSLog.disabled
//    static let NetWork              = OSLog.disabled
//    static let MQTT                 = OSLog.disabled
//    static let Bluetooth            = OSLog.disabled
//    static let Performance          = OSLog.disabled
//    static let UIViewContrllerLife  = OSLog.disabled
//    #else
    static let PointsOfInterest     = OSLog.init(subsystem: subsystem, category: OSLog.Category.pointsOfInterest)
    static let NetWork              = OSLog.init(subsystem: subsystem, category: "NetWork")
    static let MQTT                 = OSLog.init(subsystem: subsystem, category: "MQTT")
    static let Bluetooth            = OSLog.init(subsystem: subsystem, category: "Bluetooth")
    static let Performance          = OSLog.init(subsystem: subsystem, category: "Performance")
    static let UIViewContrllerLife  = OSLog.init(subsystem: subsystem, category: "UIViewContrllerLife")
//    #endif
}

// MARK: - 日志记录工具类
@objcMembers
public final class SwiftLogger: NSObject {
    
    public static let shared = SwiftLogger.init()
    
    // MARK: - 记录网络日志
    /// 记录持久化网络日志
    /// - Parameter message: 日志
    public func logNetwork(_ message: String) {
        os_log("%{public}s", log: Log.NetWork, type: .default, message)
    }
    
    /// 记录网络日志
    /// - Parameters:
    ///   - message: 日志
    ///   - type: 日志级别
    public func logNetwork(_ message: String, type: OSLogType) {
        os_log("%{public}s", log: Log.NetWork, type: type, message)
    }
    
    // MARK: - 记录MQTT日志
    /// 记录持久化MQTT日志
    /// - Parameter message: 日志
    public func logMQTT(_ message: String) {
        os_log("%{public}s", log: Log.MQTT, type: .default, message)
    }
    
    /// 记录MQTT日志
    /// - Parameters:
    ///   - message: 日志
    ///   - type: 日志级别
    public func logMQTT(_ message: String, type: OSLogType) {
        os_log("%{public}s", log: Log.MQTT, type: type, message)
    }
    
    // MARK: - 记录蓝牙日志
    /// 记录持久化蓝牙日志
    /// - Parameter message: 日志
    public func logBluetooth(_ message: String) {
        os_log("%{public}s", log: Log.Bluetooth, type: .default, message)
    }
    
    /// 记录蓝牙日志
    /// - Parameters:
    ///   - message: 日志
    ///   - type: 日志级别
    public func logBluetooth(_ message: String, type: OSLogType) {
        os_log("%{public}s", log: Log.Bluetooth, type: type, message)
    }
    
    // MARK: - 记录视图控制器生命周期日志
    /// 记录持久化视图控制器生命周期日志
    /// - Parameter message: 日志
    public func logUIViewContrllerLife(_ message: String) {
        os_log("%{public}s", log: Log.UIViewContrllerLife, type: .default, message)
    }
    
    /// 记录视图控制器生命周期日志
    /// - Parameters:
    ///   - message: 日志
    ///   - type: 日志级别
    public func logUIViewContrllerLife(_ message: String, type: OSLogType) {
        os_log("%{public}s", log: Log.UIViewContrllerLife, type: type, message)
    }
    
    // MARK: - 记录不持久化的调试日志
    /// 记录不持久化的调试日志
    /// - Parameters:
    ///   - message: 日志字符串
    ///   - log: 默认日志对象
    ///   - type: 默认debug即不持久化
    public func log(_ message: String, log: OSLog = .default, type: OSLogType = .debug) {
        os_log("调试日志%{public}s", log: log, type: type, message)
    }
}

// MARK: - 路标事件跟踪工具类
@objcMembers
public final class SwiftSignposter: NSObject {
    
    public static let shared = SwiftSignposter.init()
    
    private let timeFormatter = DateFormatter.init().then { make in
        make.dateFormat = "yyyy-MM-dd' 'HH:mm:ss.SSSS"
    }
    
    // MARK: - Get网络请求时间消耗衡量
    /// Get网络请求时间消耗衡量
    /// - Parameters:
    ///   - url: 请求URL
    ///   - timeAndURLStamp: 传入时间戳对象这个时间戳对象需要与signpostNetworkEndGetWith的一致
    public func signpostNetworkGetBeginWith(url: String, timeAndURLStamp: NSString) {
        let signpostID = OSSignpostID.init(log: Log.NetWork, object: timeAndURLStamp)
        os_signpost(.begin, log: Log.NetWork, name: "Get网络请求时间消耗衡量", signpostID: signpostID, "开始请求URL---->%{public}s", url)
    }
    
    public func signpostNetworkGetEndWith(url: String, timeAndURLStamp: NSString) {
        let signpostID = OSSignpostID.init(log: Log.NetWork, object: timeAndURLStamp)
        os_signpost(.end, log: Log.NetWork, name: "Get网络请求时间消耗衡量", signpostID: signpostID, "结束请求URL---->%{public}s", url)
    }
    
    // MARK: - Post网络请求时间消耗衡量
    /// Post网络请求时间消耗衡量
    /// - Parameters:
    ///   - url: 请求URL
    ///   - timeAndURLStamp: 传入时间戳对象这个时间戳对象需要与signpostNetworkEndPostWith的一致
    public func signpostNetworkPostBeginWith(url: String, timeAndURLStamp: NSString) {
        let signpostID = OSSignpostID.init(log: Log.NetWork, object: timeAndURLStamp)
        os_signpost(.begin, log: Log.NetWork, name: "Post网络请求时间消耗衡量", signpostID: signpostID, "开始请求URL---->%{public}s", url)
    }
    
    public func signpostNetworkPostEndWith(url: String, timeAndURLStamp: NSString) {
        let signpostID = OSSignpostID.init(log: Log.NetWork, object: timeAndURLStamp)
        os_signpost(.end, log: Log.NetWork, name: "Post网络请求时间消耗衡量", signpostID: signpostID, "结束请求URL---->%{public}s", url)
    }
    
    // MARK: - 性能路标时间消耗衡量
    /// 性能路标时间消耗衡量
    /// - Parameter id: 一串尽可能不重复的数字去跟踪你要的性能路标持续事件
    public func signpostPerformanceBeginWith(id: UInt64) {
        os_signpost(.begin, log: Log.Performance, name: "性能路标持续事件跟踪", signpostID: OSSignpostID.init(id), "ID%{public}s", "\(id)")
    }
    
    public func signpostPerformanceEndWith(id: UInt64) {
        os_signpost(.end, log: Log.Performance, name: "性能路标持续事件跟踪", signpostID: OSSignpostID.init(id), "ID%{public}s", "\(id)")
    }
    
    // MARK: - 自定义路标持续事件跟踪
    /// 自定义路标持续事件跟踪
    /// - Parameter id: 一串尽可能不重复的数字去跟踪你要的路标持续事件
    public func signpostBeginWith(id: UInt64) {
        os_signpost(.begin, log: Log.PointsOfInterest, name: "自定义路标持续事件跟踪", signpostID: OSSignpostID.init(id), "ID%{public}s", "\(id)")
    }
    
    public func signpostEndWith(id: UInt64) {
        os_signpost(.end, log: Log.PointsOfInterest, name: "自定义路标持续事件跟踪", signpostID: OSSignpostID.init(id), "ID%{public}s", "\(id)")
    }
    
    // MARK: - 自定义路标瞬时事件发生监测使用Instruments - Time Profiler - Points of interest
    /// 自定义路标瞬时事件发生监测
    /// - Parameter id: 一串尽可能不重复的数字去跟踪你要的瞬时事件
    public func signpostFlashEventWith(id: UInt64) {
        os_signpost(.event, log: Log.PointsOfInterest, name: "自定义路标瞬时事件发生", signpostID: OSSignpostID.init(id), "ID%{public}s", "\(id)")
    }
}
