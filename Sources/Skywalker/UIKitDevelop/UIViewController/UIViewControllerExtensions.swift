//
//  File.swift
//
//
//  Created by 杨俊艺 on 2022/6/12.
//

// Coordinator协调器作者在2017年的技术演讲
// https://www.youtube.com/watch?v=3ia3ngqM2mM

import UIKit

@objc
public extension UIViewController {
    var isVisible: Bool { isViewLoaded && view.window != nil }
}
