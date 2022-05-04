//
//  UITextViewRange.swift
//  
//
//  Created by 杨俊艺 on 2022/3/13.
//

import UIKit

@objc
public extension UITextView {
    
    // http://stackoverflow.com/a/28896715/359578
    
    func visibleRangeOfTextView() -> NSRange {
        let bounds = self.bounds
        let origin = CGPoint(x: 100,y: 100) //Overcome the default UITextView left/top margin
        let startCharacterRange = self.characterRange(at: origin)
        if startCharacterRange == nil {
            return NSMakeRange(0,0)
        }
        let startPosition = self.characterRange(at: origin)!.start
        
        let endCharacterRange = self.characterRange(at: CGPoint(x: bounds.maxX, y: bounds.maxY))
        if endCharacterRange == nil {
            return NSMakeRange(0,0)
        }
        let endPosition = self.characterRange(at: CGPoint(x: bounds.maxX, y: bounds.maxY))!.end
        
        let startIndex = self.offset(from: self.beginningOfDocument, to: startPosition)
        let endIndex = self.offset(from: startPosition, to: endPosition)
        return NSMakeRange(startIndex, endIndex)
    }
}
