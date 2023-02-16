//
//  Capitalized.swift
//
//
//  Created by 杨俊艺 on 2022/12/14.
//

import Foundation

@propertyWrapper
public struct Capitalized {
    private var value = ""

    public var wrappedValue: String {
        get { value }
        set { value = newValue.capitalized }
    }

    public init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}
