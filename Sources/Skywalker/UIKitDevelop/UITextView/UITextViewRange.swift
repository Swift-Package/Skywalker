//
//  UITextViewRange.swift
//
//
//  Created by 杨俊艺 on 2022/3/13.
//

// http://stackoverflow.com/a/28896715/359578

import UIKit

@objc
public extension UITextView {
    func visibleRangeOfTextView() -> NSRange {
        let bounds = self.bounds
        let origin = CGPoint(x: 100, y: 100) // Overcome the default UITextView left/top margin
        let startCharacterRange = characterRange(at: origin)
        if startCharacterRange == nil {
            return NSMakeRange(0, 0)
        }

        let startPosition = characterRange(at: origin)!.start
        let endCharacterRange = characterRange(at: CGPoint(x: bounds.maxX, y: bounds.maxY))
        if endCharacterRange == nil {
            return NSMakeRange(0, 0)
        }

        let endPosition = characterRange(at: CGPoint(x: bounds.maxX, y: bounds.maxY))!.end
        let startIndex = offset(from: beginningOfDocument, to: startPosition)
        let endIndex = offset(from: startPosition, to: endPosition)
        return NSMakeRange(startIndex, endIndex)
    }
}
