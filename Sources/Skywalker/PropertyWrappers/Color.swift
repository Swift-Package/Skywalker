//
//  Color.swift
//
//
//  Created by 杨俊艺 on 2022/12/15.
//

// https://www.youtube.com/watch?v=vyp8BaBVOhw

import UIKit

@propertyWrapper
public struct ColorWrapper {
    // MARK: - 开放这三个属性令外部可以通过投影值访问到特定的颜色,使用实例参照测试用例

    var dark: UIColor
    var light: UIColor
    var isDark: Bool { UITraitCollection.current.userInterfaceStyle == .dark }

    public var projectedValue: ColorWrapper { self }

    public var wrappedValue: UIColor { isDark ? dark : light }
}
