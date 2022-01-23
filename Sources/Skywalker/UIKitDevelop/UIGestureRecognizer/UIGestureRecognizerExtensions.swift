//
//  UIGestureRecognizerExtensions.swift
//  
//
//  Created by 杨俊艺 on 2022/1/23.
//

#if canImport(UIKit) && !os(watchOS)

import UIKit

@objc
public extension UIGestureRecognizer {
    /// 将手势识别器移除所在视图
    func removeFromView() {
        view?.removeGestureRecognizer(self)
    }
}

#endif
