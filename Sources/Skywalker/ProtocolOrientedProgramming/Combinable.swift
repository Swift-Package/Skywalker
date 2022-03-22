//
//  Combinable.swift
//  
//
//  Created by 杨俊艺 on 2022/3/22.
//

import Foundation

protocol Combinable {
    func combine(_ other: Self) -> Self
}

extension String: Combinable {
    func combine(_ other: String) -> String {
        self + other
    }
}

extension Array: Combinable {
    func combine(_ other: Array<Element>) -> Array<Element> {
        self + other
    }
}
