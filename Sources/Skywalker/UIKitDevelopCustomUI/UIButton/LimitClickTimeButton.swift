//
//  LimitClickTimeButton.swift
//
//
//  Created by 杨俊艺 on 2022/3/3.
//

import UIKit

/// 点击5次后失效的按钮
class LimitClickTimeButton: UIButton {
    private(set) var amountOfTouches: Int = 0 {
        didSet {
            if self.amountOfTouches >= 5 {
                self.isEnabled = false
                self.isUserInteractionEnabled = false
            }
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        amountOfTouches += 1
    }
}
