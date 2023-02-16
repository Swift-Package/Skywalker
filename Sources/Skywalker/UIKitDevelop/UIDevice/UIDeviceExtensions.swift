//
//  UIDeviceExtensions.swift
//
//
//  Created by 杨俊艺 on 2022/1/23.
//

#if canImport(UIKit) && !os(watchOS)

    import UIKit

    @objc
    public extension UIDevice {
        /// 当前设备是不是iPad
        /// - Returns: 是iPad返回true
        class func isIPad() -> Bool {
            return UIDevice.current.userInterfaceIdiom == .pad
        }
    }

#endif
