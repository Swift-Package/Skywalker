//
//  UIPanGestureRecognizerDirection.swift
//
//
//  Created by 杨俊艺 on 2023/9/19.
//

import UIKit

public extension UIPanGestureRecognizer {
    enum Direction: String {
        case up
        case down
        case left
        case right

        var isVertical: Bool {
            switch self {
            case .up, .down: return true
            case .left, .right: return false
            }
        }

        var isHorizontal: Bool {
            switch self {
            case .up, .down: return false
            case .left, .right: return true
            }
        }
    }

    var direction: Direction? {
        let velocity = self.velocity(in: view)
        let isVertical = abs(velocity.y) > abs(velocity.x)

        switch (isVertical, velocity.x, velocity.y) {
        case (true, _, let y) where y < 0: return .up
        case (true, _, let y) where y > 0: return .down
        case (false, let x, _) where x > 0: return .right
        case (false, let x, _) where x < 0: return .left
        default: return nil
        }
    }
}
