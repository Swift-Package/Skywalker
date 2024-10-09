//
//  UIViewGradientEffect.swift
//
//
//  Created by 杨俊艺 on 2023/9/19.
//

import UIKit

public protocol GradientEffect {
    var gradientEffectEnabled: Bool { get set }
}

extension UIView: GradientEffect {
    private enum LayerKey {
        static let gradientEffectEnabled = "gradientEffectEnabled"
    }

    @IBInspectable public var gradientEffectEnabled: Bool {
        get {
            return layer.value(forKey: LayerKey.gradientEffectEnabled) as? Bool ?? false
        } set {
            layer.setValue(newValue, forKey: LayerKey.gradientEffectEnabled)
            if newValue {
                setGradientView()
            }
        }
    }
}

public extension GradientEffect where Self: UIView {
    func setGradientView() {
        let gradientView = UIView(frame: bounds)
        let gradient = CAGradientLayer()
        gradient.frame = gradientView.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.3).cgColor]
        gradient.locations = [0.0, 1.0]
        gradientView.layer.insertSublayer(gradient, at: 0)
        addSubview(gradientView)
        bringSubviewToFront(gradientView)
    }
}
