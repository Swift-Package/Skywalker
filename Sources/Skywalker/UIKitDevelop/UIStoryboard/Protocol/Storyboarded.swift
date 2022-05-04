//
//  Storyboarded.swift
//  
//
//  Created by 杨俊艺 on 2022/2/23.
//

import UIKit

public protocol Storyboarded {
    static func instantiate() -> Self
}

// 依赖于Storyboard中的控制器的ID也设置为类名
public extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let id = String.init(describing: self)
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
    }
}
