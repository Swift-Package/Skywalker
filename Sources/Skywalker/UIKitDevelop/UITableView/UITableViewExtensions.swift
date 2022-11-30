//
//  UITableViewExtensions.swift
//  
//
//  Created by 杨俊艺 on 2022/1/23.
//

#if canImport(UIKit) && !os(watchOS)

import UIKit

public extension UITableView {
    
    func register<T: UITableViewCell>(_ : T.Type) {
        let nib = UINib.init(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReuseableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("无法通过重用标识 \(T.reuseIdentifier) 获得Cell")
        }
        return cell
    }
}

#endif
// tableVeiw.register(ItemCell.self)
// let cell = tableView.dequueReuseableCell(forIndexPath: indexPath) as ItemCell
// return cell
