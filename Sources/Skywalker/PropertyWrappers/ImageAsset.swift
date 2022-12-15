//
//  ImageAsset.swift
//  
//
//  Created by 杨俊艺 on 2022/12/14.
//

// https://www.youtube.com/watch?v=vyp8BaBVOhw

import UIKit

@propertyWrapper
public struct ImageAsset {
    
    private let key: String
    
    public init(key: String) {
        self.key = key
    }
    
    public var wrappedValue: UIImage {
        UIImage.init(named: key) ?? UIImage.init()
    }
    
    /// 投影值直接为key即图片名称
    public var projectedValue: String { key }
}
