//
//  UIViewControllerCustomUI.swift
//
//
//  Created by 杨俊艺 on 2022/6/7.
//

import UIKit

@available(iOS 14.0, *)
@objc
public extension UIViewController {
    /// 自定义导航栏返回按钮图标
    /// - Parameter iconName: 图标名称
    func customNavBackIcon(_ iconName: String) {
        let navBackButton = UIButton().then { make in
            make.setImage(.init(named: iconName), for: .normal)
            make.frame = CGRect(origin: .zero, size: .init(width: 44, height: 44))
            make.translatesAutoresizingMaskIntoConstraints = true
        }

        navBackButton.addAction(.init(handler: { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
        }), for: .touchUpInside)

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navBackButton)
    }
}
