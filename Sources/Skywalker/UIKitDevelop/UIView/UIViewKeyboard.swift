//
//  UIViewKeyboard.swift
//  
//
//  Created by 杨俊艺 on 2022/2/23.
//

import UIKit

@objc
public extension UIView {
    
    /// 关闭键盘
    func closeKeyboard() {
        for view in self.subviews where view.isFirstResponder {
            view.resignFirstResponder()
        }
    }
}
