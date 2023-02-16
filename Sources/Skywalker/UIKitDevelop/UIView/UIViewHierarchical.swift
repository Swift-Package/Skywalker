//
//  UIViewHierarchical.swift
//
//
//  Created by 杨俊艺 on 2022/3/24.
//

import UIKit

@objc
public extension UIView {
    /// 添加一系列子视图
    /// - Parameter subviews: 子视图数组
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }

    /// 移除所有子视图
    func removeSubviews() {
        subviews.forEach { $0.removeFromSuperview() }
    }

    /// 在父视图中撑满
    /// - Parameter parent: 父视图
    func pinToParent(parent: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        parent.addSubview(self)
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: parent.topAnchor),
            bottomAnchor.constraint(equalTo: parent.bottomAnchor),
            leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            trailingAnchor.constraint(equalTo: parent.trailingAnchor),
        ])
    }
}
