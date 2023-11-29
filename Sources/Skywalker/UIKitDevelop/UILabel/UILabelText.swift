//
//  UILabelText.swift
//
//
//  Created by 杨俊艺 on 2023/7/14.
//

import UIKit

@objc
public extension UILabel {
    /// 添加文字的字间距
    /// - Parameters:
    ///   - spacing: 间距
    ///   - text: 文字
    func addCharactersSpacing(spacing: CGFloat, text: String) {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSMakeRange(0, text.count - 1))
        attributedText = attributedString
    }

    /// 文本行数
    var lines: Int {
        layoutIfNeeded()
        let textSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let rHeight = lroundf(Float(sizeThatFits(textSize).height))
        let charSize = lroundf(Float(font.lineHeight))
        return rHeight / charSize
    }
}
