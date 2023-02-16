//
//  CounterView.swift
//
//
//  Created by 杨俊艺 on 2022/4/29.
//

import UIKit

// https://www.raywenderlich.com/10946920-core-graphics-tutorial-gradients-and-contexts

extension CounterView {
    private enum Constants {
        static let arcWidth: CGFloat = 76 // 背景圆弧宽度
        static let lineWidth: CGFloat = 5.0 // 圆弧线宽
        static let numberOfGlasses = 8 // 背景圆弧刻度的总数
        static var halfOfLineWidth: CGFloat { lineWidth / 2 } // 内缩线宽的一半防止被裁剪
    }
}

@IBDesignable
@objcMembers
public class CounterView: UIView {
    @IBInspectable var outlineColor: UIColor = .init(red: 34, green: 110, blue: 100, alpha: 1) // 刻度圆弧颜色
    @IBInspectable var counterColor: UIColor = .init(red: 87, green: 218, blue: 213, alpha: 1) // 背景圆弧的颜色

    // 当前刻度
    @IBInspectable var currentCounter: Int = 5 {
        didSet {
            if currentCounter <= Constants.numberOfGlasses {
                setNeedsDisplay()
            }
            if currentCounter >= Constants.numberOfGlasses {
                currentCounter = Constants.numberOfGlasses
            }
        }
    }

    override public func draw(_ rect: CGRect) {
        let startAngle: CGFloat = 3 * .pi / 4
        let endAngle: CGFloat = .pi / 4
        let radiusBase = max(bounds.width, bounds.height) // 半径基准
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)

        // MARK: - 绘制大圆弧

        // 想象一下用一个圆规来画这个——你把圆规固定的点放在中间，把圆规的支架张开到你需要的半径装上一根厚厚的铅笔然后旋转它来画出你的弧形
        // 在这代码里面center是圆规的固定点radius是圆规打开的宽度(减去笔的一半的宽度,因为笔尖其实是在线条的中心),然后圆弧的宽度就是铅笔的宽度
        counterColor.setStroke()
        let path = UIBezierPath(arcCenter: center, radius: (radiusBase - Constants.arcWidth) / 2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        path.lineWidth = Constants.arcWidth
        path.stroke()

        // MARK: - 绘制蓝色空心圆弧

        let angleDifference: CGFloat = 2 * .pi - startAngle + endAngle // 获得用来分配的总弧度
        let arcLengthPerGlass = angleDifference / CGFloat(Constants.numberOfGlasses) // 每杯水占用的弧度
        let outlineEndAngle = startAngle + arcLengthPerGlass * CGFloat(currentCounter) // 外圆弧的终点弧度
        let outerArcRadius = bounds.width / 2 - Constants.halfOfLineWidth // 外圆弧半径
        let outlinePath = UIBezierPath(arcCenter: center, radius: outerArcRadius, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
        outlinePath.lineWidth = Constants.lineWidth
        // outlinePath.close()

        outlineColor.setStroke()
        let innerArcRadius = bounds.width / 2 - Constants.arcWidth + Constants.halfOfLineWidth // 内圆弧半径
        outlinePath.addArc(withCenter: center, radius: innerArcRadius, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false) // 使用逆时针将会自动在外圆弧和内圆弧之间绘制一条直线
        outlinePath.close() // 关闭路径会自动在圆弧的另一端绘制一条线
        outlinePath.stroke()

        // MARK: - 绘制刻度

        guard let context = UIGraphicsGetCurrentContext() else { return }
        // 保存状态方便之后绘制
        context.saveGState()
        outlineColor.setFill()

        let markerWidth: CGFloat = 5.0
        let markerHeight: CGFloat = 10.0
        let markerPath = UIBezierPath(rect: CGRect(x: -markerWidth / 2, y: 0, width: markerWidth, height: markerHeight))
        // markerPath.fill()
        // 将上下文原点平移到上下文坐标系中心 - 取消前后两个注释就懂了markerPath.fill()
        context.translateBy(x: rect.width / 2, y: rect.height / 2)
        // markerPath.fill()

        for i in 0 ... Constants.numberOfGlasses {
            context.saveGState() // 保存上下文居中 旋转和平移具有前后依赖性
            // 从第一个点开始考虑 本来刻度startAngle在90度是原始位置 每个刻度增加一定的度数
            let startAngle = startAngle - .pi / 2
            let angle = startAngle + arcLengthPerGlass * CGFloat(i)
            context.rotate(by: angle)
            context.translateBy(x: 0, y: rect.height / 2 - markerHeight)

            markerPath.fill()

            context.restoreGState() // 恢复上下文居中
        }

        // 恢复状态方便之后绘制
        context.restoreGState()
    }
}
