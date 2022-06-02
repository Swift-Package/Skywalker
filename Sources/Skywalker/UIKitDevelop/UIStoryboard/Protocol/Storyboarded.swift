//
//  Storyboarded.swift
//  
//
//  Created by 杨俊艺 on 2022/2/23.
//

import UIKit

// https://www.youtube.com/watch?v=7HgbcTqxoN4

public protocol Storyboarded {
    static func instantiate() -> Self
}

// 依赖于Storyboard中的控制器的ID也设置为类名
public extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        return UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: String.init(describing: self)) as! Self
    }
}
