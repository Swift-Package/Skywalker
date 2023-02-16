//
//  CollectionSafe.swift
//
//
//  Created by 杨俊艺 on 2022/12/26.
//

import Foundation

public extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
