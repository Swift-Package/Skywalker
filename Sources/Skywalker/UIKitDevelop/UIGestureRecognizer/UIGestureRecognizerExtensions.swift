//
//  UIGestureRecognizerExtensions.swift
//
//
//  Created by 杨俊艺 on 2022/1/23.
//

#if canImport(UIKit) && !os(watchOS)

    import UIKit

    // Coordinator协调器作者在2017年的技术演讲
    // https://www.youtube.com/watch?v=3ia3ngqM2mM

    @objc
    public extension UIGestureRecognizer {
        /// 将手势识别器移除所在视图
        func removeFromView() {
            view?.removeGestureRecognizer(self)
        }

        /// 取消手势识别器
        func cancel() {
            isEnabled = false
            isEnabled = true
        }
    }

#endif
