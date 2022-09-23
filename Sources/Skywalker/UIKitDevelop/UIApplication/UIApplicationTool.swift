//
//  UIApplicationTool.swift
//  
//
//  Created by 杨俊艺 on 2022/7/12.
//

import UIKit

@objc
public extension UIApplication {
    
    /// 清除启动页缓存
    func clearLaunchScreenCache() {
        do {
            try FileManager.default.removeItem(atPath: NSHomeDirectory() + "/Library/SplashBoard")
            print("Skywalker 清除启动页缓存成功")
        } catch {
            print("Skywalker 清除启动页缓存失败")
        }
    }
    
}
