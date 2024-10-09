//
//  PanDirectionGestureRecognizer.swift
//
//
//  Created by 杨俊艺 on 2023/9/20.
//

// https://stackoverflow.com/questions/7100884/uipangesturerecognizer-only-vertical-or-horizontal
import UIKit

enum PanAxis {
    case vertical
    case horizontal
}

class PanDirectionGestureRecognizer: UIPanGestureRecognizer {
    let axis: PanAxis
    var touchBeganPoint: CGPoint = .zero
    var currentTouchStartPoint: CGPoint?

    init(axis: PanAxis, target: AnyObject, action: Selector) {
        self.axis = axis
        super.init(target: target, action: action)
    }

    init(axis: PanAxis) {
        self.axis = axis
        super.init(target: nil, action: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        touchBeganPoint = location(in: view)
        currentTouchStartPoint = touchBeganPoint
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)

        if state == .began {
            let vel = velocity(in: view)
            switch axis {
            case .horizontal where abs(vel.y) > abs(vel.x):
                state = .cancelled
            case .vertical where abs(vel.x) > abs(vel.y):
                state = .cancelled
            default:
                break
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        currentTouchStartPoint = nil
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)
        currentTouchStartPoint = nil
    }
}

// 扩展Block
typealias GestureRecognizerHandle = (_ recognizer: UIGestureRecognizer) -> Void

class GesHandleWrapper: NSObject {
    var handle: GestureRecognizerHandle

    init(_ handle: @escaping GestureRecognizerHandle) {
        self.handle = handle
    }

    @objc func handleExcute(_ recognizer: UIGestureRecognizer) {
        handle(recognizer)
    }
}

extension UIGestureRecognizer {
    static var UIGestureRecognizerAssociatedKey = "UIGestureRecognizerAssociatedKey"

    var handleWrapper: GesHandleWrapper? {
        get {
            return objc_getAssociatedObject(self, &UIGestureRecognizer.UIGestureRecognizerAssociatedKey) as? GesHandleWrapper
        }
        set {
            objc_setAssociatedObject(self, &UIGestureRecognizer.UIGestureRecognizerAssociatedKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    func addHandle(_ handle: @escaping GestureRecognizerHandle) {
        if handleWrapper == nil {
            handleWrapper = GesHandleWrapper { _ in }
        }
        handleWrapper?.handle = handle
        if let handleWrapper = handleWrapper {
            addTarget(handleWrapper, action: #selector(GesHandleWrapper.handleExcute(_:)))
        }
    }

    func removeHandle(_: GestureRecognizerHandle) {
        handleWrapper = nil
    }
}
