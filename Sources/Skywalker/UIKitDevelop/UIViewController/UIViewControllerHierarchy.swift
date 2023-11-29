//
//  UIViewControllerHierarchy.swift
//
//
//  Created by 杨俊艺 on 2022/12/9.
//

import UIKit

@objc
public extension UIViewController {
    @discardableResult
    func addChildController(_ child: UIViewController?, bottomAnchor: NSLayoutYAxisAnchor? = nil) -> UIViewController? {
        guard let child = child else { return nil }

        if child.parent != nil {
            child.removeFromParentVC()
        }

        child.willMove(toParent: self)
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)

        child.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            child.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            child.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            child.view.topAnchor.constraint(equalTo: view.topAnchor),
            child.view.bottomAnchor.constraint(equalTo: bottomAnchor ?? view.bottomAnchor),
        ])

        return child
    }

    /// ⚠️这个方法名称不能写成removeFromParentViewController,这会导致在Objective-C中替换掉原来的removeFromParentViewController选择器进而导致键盘布局错乱2023年1月31日于海沧盈趣科技
    func removeFromParentVC() {
        guard parent != nil else { return }

        DispatchQueue.main.async {
            self.willMove(toParent: nil)
            NSLayoutConstraint.deactivate(self.view.constraints)
            self.view.removeFromSuperview()
            self.removeFromParent()
        }
    }
}

public extension UIViewController {
    
    @available(iOS, introduced: 12, deprecated: 13, obsoleted: 14, message: "iOS 13前的代码可以使用此扩展但不推荐使用,后续将移除!")
    class var rootTabBarController: UITabBarController? {
        guard let keyWindow = UIApplication.shared.keyWindow else { return nil }
        return keyWindow.rootViewController as? UITabBarController
    }
    
    @available(iOS, introduced: 12, deprecated: 13, obsoleted: 14, message: "iOS 13前的代码可以使用此扩展但不推荐使用,后续将移除!")
    class var topMost: UIViewController? {
        guard let keyWindow = UIApplication.shared.keyWindow else { return nil }
        return self.topMost(of: keyWindow.rootViewController)
    }
    
    class func topMost(of viewController: UIViewController?) -> UIViewController? {
        if let presentedViewController = viewController?.presentedViewController {
            return self.topMost(of: presentedViewController)
        }
        
        if let tabBarController = viewController as? UITabBarController,
            let selectedViewController = tabBarController.selectedViewController {
            return self.topMost(of: selectedViewController)
        }
        
        if let navigationController = viewController as? UINavigationController,
            let visibleViewController = navigationController.visibleViewController {
            return self.topMost(of: visibleViewController)
        }
        
        if let pageViewController = viewController as? UIPageViewController,
            pageViewController.viewControllers?.count == 1 {
            return self.topMost(of: pageViewController.viewControllers?.first)
        }
        
        for subview in viewController?.view?.subviews ?? [] {
            if let childViewController = subview.next as? UIViewController {
                return self.topMost(of: childViewController)
            }
        }
        
        return viewController
    }
}
