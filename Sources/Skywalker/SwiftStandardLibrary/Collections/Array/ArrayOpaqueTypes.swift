//
//  ArrayOpaqueTypes.swift
//
//
//  Created by 杨俊艺 on 2022/12/14.
//

import Foundation

public extension Array where Element == String {
    func transformToInts() -> some Sequence {
        lazy.compactMap { Int($0) }
    }
}
