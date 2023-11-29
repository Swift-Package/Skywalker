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

public protocol Reusable { }

extension UITableViewCell: Reusable { }
extension UICollectionViewCell: Reusable { }

extension UITableView {
    
    func register<T: Reusable>(_ type: T.Type) {
        let identifier = String(describing: T.self)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("❗️Couldn't dequeue cell with identifier \(String(describing: T.self))")
        }
        return cell
    }
}

extension UICollectionView {
    func register<T: Reusable>(_ type: T.Type) {
        let identifier = String(describing: T.self)
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("❗️Couldn't dequeue cell with identifier \(String(describing: T.self))")
        }
        return cell
    }
}
// collectionView.register(ImageCell.self)
// let cell = collectionView.dequeueReusableCell(for: indexPath) as ImageCell

#endif
