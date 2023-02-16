//
//  UIViewGraphics.swift
//
//
//  Created by 杨俊艺 on 2022/3/24.
//

import UIKit

@objc
public extension UIView {
    /// 截图
    var screenshot: UIImage? {
        UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, 0)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        layer.render(in: context)
        return UIGraphicsGetImageFromCurrentImageContext()
    }

    /// 绘制虚线
    /// - Parameters:
    ///   - point1: 起点
    ///   - point2: 终点
    ///   - color: 虚线颜色
    ///   - strokeLength: 线段长度
    ///   - gapLength: 空白长度
    ///   - width: 虚线宽度
    func createDashedLine(from point1: CGPoint, to point2: CGPoint, width: CGFloat, color: UIColor, strokeLength: NSNumber, gapLength: NSNumber) {
        let shapeLayer = CAShapeLayer()

        shapeLayer.lineWidth = width
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineDashPattern = [strokeLength, gapLength]

        let path = CGMutablePath()
        path.addLines(between: [point1, point2])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
}
