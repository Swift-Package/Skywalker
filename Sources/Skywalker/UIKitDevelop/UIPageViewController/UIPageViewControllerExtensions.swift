//
//  UIPageViewControllerExtensions.swift
//  
//
//  Created by 杨俊艺 on 2022/11/24.
//

import UIKit

@objc
public extension UIPageViewController {
    
    /// 跳转到下一页
    /// - Parameters:
    ///   - animated: 是否动画
    ///   - completion: 完成回调
    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }// 切换结束时好像数组中只有一个视图控制器就是结束时的那个
        guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }
        setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
    }
    
    /// 跳转到上一页
    /// - Parameters:
    ///   - animated: 是否动画
    ///   - completion: 完成回调
    func goToPreviousPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else { return }// 切换结束时好像数组中只有一个视图控制器就是结束时的那个
        guard let previewPage = dataSource?.pageViewController(self, viewControllerBefore: currentPage) else { return }
        setViewControllers([previewPage], direction: .forward, animated: animated, completion: completion)
    }
    
    /// 跳转到特定下标页
    /// - Parameters:
    ///   - index: 下标
    ///   - pages: 目前控制器持有的子视图控制器数组
    func goToSpecificPage(index: Int, ofViewControllers pages: [UIViewController]) {
        setViewControllers([pages[index]], direction: .forward, animated: true, completion: nil)
    }
}
