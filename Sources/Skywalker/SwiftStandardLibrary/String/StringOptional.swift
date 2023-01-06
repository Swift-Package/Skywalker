//
//  StringOptional.swift
//  
//
//  Created by 杨俊艺 on 2023/1/6.
//

// https://www.swiftwithvincent.com/tips

import Foundation

public extension Optional where Wrapped == String {
    
    var orEmpty: String {
        self ?? ""
    }
    
    var isNilOrEmpty: Bool {
        self == nil || self == ""
    }
}
