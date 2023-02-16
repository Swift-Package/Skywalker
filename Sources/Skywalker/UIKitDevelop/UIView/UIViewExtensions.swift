//
//  UIViewExtensions.swift
//
//
//  Created by 杨俊艺 on 2022/1/23.
//

import UIKit

@objc
public extension UIView {
    /// 添加一系列子视图便捷书写方法view.add(subviews: firstView, secondView)
    /// - Parameter subviews: 子视图
    @nonobjc func add(subviews: UIView...) {
        for subView in subviews {
            addSubview(subView)
        }
    }
}
