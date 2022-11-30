//
//  UIViewCoordinate.swift
//  
//
//  Created by 杨俊艺 on 2022/3/24.
//

import UIKit

@objc
public extension UIView {
    
    var x: CGFloat {
        get { frame.origin.x }
        set { frame.origin.x = newValue }
    }
    
    var y: CGFloat {
        get { frame.origin.y }
        set { frame.origin.y = newValue }
    }
    
    var height: CGFloat {
        get { frame.size.height }
        set { frame.size.height = newValue }
    }
    
    var width: CGFloat {
        get { frame.size.width }
        set { frame.size.width = newValue }
    }
    
    var size: CGSize {
        get { frame.size }
        set {
            width = newValue.width
            height = newValue.height
        }
    }
    
    var isRightToLeft: Bool {
        if #available(iOS 10.0, macCatalyst 13.0, tvOS 10.0, *) {
            return effectiveUserInterfaceLayoutDirection == .rightToLeft
        } else {
            return false
        }
    }
}
