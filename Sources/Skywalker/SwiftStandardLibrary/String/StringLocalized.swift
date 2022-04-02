//
//  StringLocalized.swift
//  
//
//  Created by 杨俊艺 on 2022/4/2.
//

import Foundation

public extension String {
    
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: Bundle.module, value: self, comment: self)
    }
    
}
