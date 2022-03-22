//
//  UITableViewCellExtensions.swift
//  
//
//  Created by 杨俊艺 on 2022/1/23.
//

#if canImport(UIKit) && !os(watchOS)

import UIKit

// MARK: - UITableViewCell注册最佳实践
@objc
public extension UITableViewCell {
    static var reuseIdentifier: String {
        return String.init(describing: self)
    }
    
    static var nibName: String {
        return String.init(describing: self)
    }
    
    static func nib() -> UINib {
        return UINib.init(nibName: self.nibName, bundle: nil)
    }
}

#endif

