//
//  StringExtensions.swift
//  
//
//  Created by 杨俊艺 on 2022/1/23.
//

import Foundation

public extension String {
    /// 是不是email格式
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", emailRegEx)
        return predicate.evaluate(with: self)
    }
    
}
