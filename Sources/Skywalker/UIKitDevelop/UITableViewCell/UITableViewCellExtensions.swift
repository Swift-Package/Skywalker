//
//  UITableViewCellExtensions.swift
//
//
//  Created by 杨俊艺 on 2022/1/23.
//

#if canImport(UIKit) && !os(watchOS)

    import UIKit

    @objc
    public extension UITableViewCell {
        static var reuseIdentifier: String {
            return String(describing: self)
        }

        static var nibName: String {
            return String(describing: self)
        }

        static func nib() -> UINib {
            return UINib(nibName: nibName, bundle: nil)
        }
    }

#endif
