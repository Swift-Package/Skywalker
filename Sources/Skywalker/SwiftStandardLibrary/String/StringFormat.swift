//
//  StringFormat.swift
//  
//
//  Created by 杨俊艺 on 2022/3/1.
//

import Foundation

public extension String {
    func truncatedPrefix(_ maxLength: Int, using truncator: String = "...") -> String {
        "\(prefix(maxLength))\(truncator)"
    }
}
