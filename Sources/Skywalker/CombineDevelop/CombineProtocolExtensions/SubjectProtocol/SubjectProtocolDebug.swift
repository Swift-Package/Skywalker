//
//  SubjectProtocolDebug.swift
//  
//
//  Created by 杨俊艺 on 2022/4/22.
//

import Foundation
import Combine

public extension Subject where Output == String {
    
    /// 向主题填充要发布的数据方便调试
    /// - Parameter data: 一个[(TimeInterval, String)]  TimeInterval指定要发布的时间点  String指定要发布的值
    func feed(with data: [(TimeInterval, String)]) {
        var lastDelay: TimeInterval = 0
        for entry in data {
            lastDelay = entry.0
            DispatchQueue.main.asyncAfter(deadline: .now() + entry.0) { [unowned self] in
                self.send(entry.1)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + lastDelay + 1.5) { [unowned self] in
            self.send(completion: .finished)
        }
    }
}

/// 更高抽象度的扩展
public extension Subject {
    
    /// 向主题填充要发布的数据方便调试
    /// - Parameter data: 一个[(TimeInterval, Output)]  TimeInterval指定要发布的时间点  Output指定要发布的值
    func feed(with data: [(TimeInterval, Output)]) {
        var lastDelay: TimeInterval = 0
        
        for entry in data {
            lastDelay = entry.0
            DispatchQueue.main.asyncAfter(deadline: .now() + entry.0) { [unowned self] in
                self.send(entry.1)
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + lastDelay + 1.5) { [unowned self] in
            self.send(completion: .finished)
        }
    }
}

public let typingHelloWorld: [(TimeInterval, String)] = [
    (0.0, "H"),
    (0.1, "He"),
    (0.2, "Hel"),
    (0.3, "Hell"),
    (0.5, "Hello"),
    (0.6, "Hello "),
    (2.0, "Hello W"),
    (2.1, "Hello Wo"),
    (2.2, "Hello Wor"),
    (2.4, "Hello Worl"),
    (2.5, "Hello World")
]
