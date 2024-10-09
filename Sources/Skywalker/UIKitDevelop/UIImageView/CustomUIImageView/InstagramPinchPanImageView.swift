//
//  InstagramPinchPanImageView.swift
//
//
//  Created by 杨俊艺 on 2023/9/19.
//

// https://medium.com/@jeremysh/instagram-pinch-to-zoom-pan-gesture-tutorial-772681660dfe
import UIKit

public class ISImageView: UIImageView {
    @IBInspectable public var isInteractable: Bool = false {
        didSet {
            guard oldValue != isInteractable else { return }
            if isInteractable {
                setupGesture()
                cellForTarget(superview: superview)?.clipsToBounds = false
                isUserInteractionEnabled = true
                pinchGesture.map { addGestureRecognizer($0) }
                panGesture.map { addGestureRecognizer($0) }
            } else {
                pinchGesture.map { removeGestureRecognizer($0) }
                panGesture.map { removeGestureRecognizer($0) }
            }
        }
    }

    private var isPinching = false
    private var pinchGesture: UIPinchGestureRecognizer?
    private var panGesture: UIPanGestureRecognizer?
    private var originalCenter: CGPoint?

    private func setupGesture() {
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchGesture(sender:)))
        pinchGesture?.delegate = self
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(sender:)))
        panGesture?.delegate = self
    }

    private func cellForTarget(superview: UIView?) -> UIView? {
        guard superview != nil else { return nil }
        if superview is UITableViewCell || superview is UICollectionViewCell {
            return superview
        } else {
            return cellForTarget(superview: superview?.superview)
        }
    }

    @objc private func handlePinchGesture(sender: UIPinchGestureRecognizer) {
        switch sender.state {
        case .began:
            isPinching = sender.scale > 1
            layer.zPosition = 1
            cellForTarget(superview: superview)?.layer.zPosition = 1
        case .changed:
            guard let view = sender.view, isPinching else { return }
            let center = CGPoint(x: sender.location(in: view).x - view.bounds.midX,
                                 y: sender.location(in: view).y - view.bounds.midY)
            view.transform = view.transform
                .translatedBy(x: center.x, y: center.y)
                .scaledBy(x: sender.scale, y: sender.scale)
                .translatedBy(x: -center.x, y: -center.y)
            sender.scale = 1
        case .ended, .cancelled, .failed:
            reset()
        default:
            break
        }
    }

    @objc private func handlePanGesture(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began where isPinching:
            originalCenter = sender.view?.center
        case .changed where isPinching:
            guard let view = sender.view else { return }
            let translation = sender.translation(in: self)
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
            sender.setTranslation(.zero, in: superview)
        default:
            break
        }
    }

    private func reset() {
        UIView.animate(withDuration: 0.3, animations: {
            self.transform = .identity
            self.center = self.originalCenter ?? self.center
        }) { _ in
            self.isPinching = false
            self.layer.zPosition = 0
            self.cellForTarget(superview: self.superview)?.layer.zPosition = 0
        }
    }
}

extension ISImageView: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == pinchGesture && otherGestureRecognizer.view is UIScrollView {
            return false
        }
        if gestureRecognizer == panGesture && otherGestureRecognizer.view is UIScrollView {
            return true
        }
        return true
    }
}
