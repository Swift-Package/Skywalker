//
//  MainActorSafe.swift
//  Skywalker
//
//  Created by 杨俊艺 on 2024/10/21.
//

// https://onevcat.com/2024/07/swift-6/ 王巍博客 - Swift 6 适配的一些体会以及对现状的小吐槽

import Foundation

extension MainActor {
    static func runSafely<T>(_ block: @MainActor () -> T) throws -> T {
        if Thread.isMainThread {
            return MainActor.assumeIsolated { block() }
        } else {
            MainActor.assertIsolated("This method is expected to be called in main thread!")
            return DispatchQueue.main.sync {
                MainActor.assumeIsolated { block() }
            }
        }
    }
}
