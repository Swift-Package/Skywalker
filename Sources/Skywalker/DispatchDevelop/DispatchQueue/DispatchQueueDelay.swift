//
//  DispatchQueueDelay.swift
//  
//
//  Created by 杨俊艺 on 2022/3/8.
//

import Foundation

@objc
public extension DispatchQueue {
    
    /// 几秒后在主线程上回调Closure
    /// - Parameters:
    ///   - delay: 延迟时间/秒
    ///   - closure: 回调闭包
    class func delay(_ delay: Double, closure: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay, execute: closure)
    }
}
