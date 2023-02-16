//
//  UIViewInstantiate.swift
//
//
//  Created by 杨俊艺 on 2022/3/24.
//

import UIKit

@objc
public extension UIView {
    class func loadFromNib(named name: String, bundle: Bundle? = nil) -> UIView? {
        return UINib(nibName: name, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }

    /// 从Nib实例化视图
    /// - Parameters:
    ///   - name: UIView类或者子类
    ///   - bundle: Bundle对象默认nil
    /// - Returns: 视图
    @nonobjc class func loadFromNib<T: UIView>(withClass name: T.Type, bundle: Bundle? = nil) -> T {
        let named = String(describing: name)
        guard let view = UINib(nibName: named, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? T else {
            fatalError("First element in xib file \(named) is not of type \(named)")
        }
        return view
    }
}
