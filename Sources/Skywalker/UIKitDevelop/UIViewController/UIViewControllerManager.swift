//
//  UIViewControllerManager.swift
//  
//
//  Created by 杨俊艺 on 2022/1/22.
//

import UIKit

@objc
public class UIViewControllerManager: NSObject {
    public static let manager = UIViewControllerManager.init()
    
    /// 获取根视图控制器
    @available(iOS 13.0, *)
    public func getRootViewController() -> UIViewController {
        return (UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene } // 只取出能转换成非空UIWindowScene对象组成一个数组
                    .flatMap { $0.windows }              // 各个场景有多个windows将它拍扁成一维数组
                    .first { $0.isKeyWindow }?.rootViewController)!// 取出第一个是keyWindow的
    }
    
    /// 获取当前标签栏视图控制器
    @available(iOS 13.0, *)
    public func getCurrentTabBarController() -> UITabBarController? {
        if let tabBarVC = getRootViewController() as? UITabBarController {
            return tabBarVC
        } else {
            return nil
        }
    }
    
    /// 获取当前导航视图控制器
    /// - Returns: 当前导航视图控制器
    @available(iOS 13.0, *)
    public func getCurrentNavigationViewController() -> UINavigationController? {
        guard let currentNavigationController = matchNavigationController(with: getRootViewController()) else { return nil }
        return currentNavigationController
    }
    
    public func matchNavigationController(with viewController: UIViewController?) -> UINavigationController? {
        // 如果该视图控制器存在被它以present展示出来的视图控制器(非根视图控制器)则递归到下一级被它展示出来视图控制器直到vc是屏幕上最先接触用户的，因为有可能弹出的模态控制器是使用UINavigationController包装过的再present弹出来的
        // 但其实这个类的所有函数只是为了服务于JLRoutes无法访问self.navigationController而写的所以这个函数并不服务于普通业务逻辑因为在普通业务逻辑中控制器有self.navigationController就可以获取到
        if let presentedViewController = viewController?.presentedViewController {
            if let nav = matchNavigationController(with: presentedViewController) {
                return nav
            }
        }
        
        if let tabBarVC = viewController as? UITabBarController {
            return matchNavigationController(with: tabBarVC.selectedViewController)
        }
        
        if let nav = viewController as? UINavigationController {
            return nav
        }
        
        return nil
    }
    
    /// 获取当前视图控制器
    @available(iOS 13.0, *)
    public func getCurrentViewController() -> UIViewController {
        return getTopViewController(with: getRootViewController())
    }
    
    /// 获取最顶层视图控制器
    public func getTopViewController(with viewController: UIViewController) -> UIViewController {
        // 如果VC有导航控制器包装着就拿导航视图控制器的visibleViewController
        if let nav = matchNavigationController(with: viewController) {
            return getTopViewController(with: nav.visibleViewController!)
        }
        // 如果VC有展示出来的视图控制器就拿被VC展示出来的视图控制器
        if viewController.presentedViewController != nil {
            return getTopViewController(with: viewController.presentedViewController!)
        }
        return viewController
    }
    
}

