//
//  CurveLineTabBarView.swift
//
//
//  Created by 杨俊艺 on 2023/2/13.
//

// https://www.youtube.com/watch?v=uvTT6UbxTYc

import UIKit

public class CurveLineTabBarView: UITabBar {
    required init?(coder: NSCoder) { super.init(coder: coder) }

    var centeredWidth: CGFloat = 0
    private var shapelayer: CAShapeLayer?

    override public func draw(_: CGRect) {
        tintColor = .white
        unselectedItemTintColor = .black
        centeredWidth = bounds.width / 2

        addShape()
    }

    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = getPath()
        shapeLayer.lineWidth = 1
        shapeLayer.shadowOpacity = 0.2
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOffset = .init(width: 0, height: 0)

        // 如果shapeLayer已经设置了就替换
        if let oldShape = shapelayer {
            layer.replaceSublayer(oldShape, with: shapeLayer)
        } else { // 如果没有shapeLayer就是第一次添加
            layer.insertSublayer(shapeLayer, at: 0)
        }
        shapelayer = shapeLayer
    }

    private func getPath() -> CGPath {
        let height: CGFloat = 60

        let path = UIBezierPath()
        path.move(to: .init(x: 0, y: 0))
        path.addLine(to: .init(x: centeredWidth - height * 2, y: 0))

        path.addCurve(to: .init(x: centeredWidth, y: height), controlPoint1: .init(x: centeredWidth - 30, y: 0), controlPoint2: .init(x: centeredWidth - 35, y: height))
        path.addCurve(to: .init(x: centeredWidth + height * 2, y: 0), controlPoint1: .init(x: centeredWidth + 35, y: height), controlPoint2: .init(x: centeredWidth + 30, y: 0))

        path.addLine(to: .init(x: bounds.width, y: 0))
        path.addLine(to: .init(x: bounds.width, y: bounds.height))
        path.addLine(to: .init(x: 0, y: bounds.height))
        path.addLine(to: .init(x: 0, y: 0))
        path.close()
        return path.cgPath
    }

    func updateCurveForTappedIndex() {
        guard let selectedTabView = selectedItem?.value(forKey: "view") as? UIView else { return }
        centeredWidth = selectedTabView.frame.origin.x + selectedTabView.frame.width / 2
        addShape()
    }

    override public func didMoveToSuperview() {
        super.didMoveToSuperview()
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.updateCurveForTappedIndex()
        }
    }
}
