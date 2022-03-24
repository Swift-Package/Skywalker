//
//  UIViewKeyboard.swift
//  
//
//  Created by 杨俊艺 on 2022/2/23.
//

import Foundation
import UIKit

@objc
public extension UIView {
    
    func closeKeyboard() {
      for view in self.subviews where view.isFirstResponder {
          view.resignFirstResponder()
      }
    }
    
}
