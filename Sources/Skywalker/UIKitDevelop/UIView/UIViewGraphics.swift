//
//  UIViewGraphics.swift
//  
//
//  Created by 杨俊艺 on 2022/3/24.
//

import Foundation

@objc
public extension UIView {
    
    var screenshot: UIImage? {
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, 0)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
}
