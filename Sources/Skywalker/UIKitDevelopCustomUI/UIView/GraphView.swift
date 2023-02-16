//
//  GraphView.swift
//
//
//  Created by 杨俊艺 on 2022/4/29.
//

// https://www.raywenderlich.com/10946920-core-graphics-tutorial-gradients-and-contexts

import UIKit

extension GraphView {
    private enum Constants {
        static let cornerRadiusSize = CGSize(width: 8.0, height: 8.0) // 上下文裁剪圆角
        static let margin: CGFloat = 20.0
        static let topBorder: CGFloat = 60
        static let bottomBorder: CGFloat = 50
        static let colorAlpha: CGFloat = 0.3
        static let circleDiameter: CGFloat = 5.0 // 圆点直径
    }
}

@IBDesignable
@objcMembers
public class GraphView: UIView {
    @IBInspectable var startColor: UIColor = .red
    @IBInspectable var endColor: UIColor = .green

    // 样本点 变更时需要setNeedsDisplay()
    var graphPoints = [4, 2, 6, 4, 5, 8, 3]

    override public func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }

        // MARK: - 创建路径并addClip在图形上下文中切出圆角再绘制渐变

        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .allCorners, cornerRadii: Constants.cornerRadiusSize)
        path.addClip()

        // MARK: - 在图形上下文中绘制渐变底板

        let colorSpace = CGColorSpaceCreateDeviceRGB() // 获取颜色空间(所有上下文都有一个颜色空间)
        let colors = [startColor.cgColor, endColor.cgColor]
        let colorLocations: [CGFloat] = [0.0, 1.0]
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x: 0, y: bounds.height)

        guard let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: colorLocations) else { return }
        context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])

        // MARK: - 创建数据折线路径并保持上下文状态但不绘制

        let width = rect.width
        let height = rect.height

        let margin = Constants.margin
        let topBorder = Constants.topBorder
        let bottomBorder = Constants.bottomBorder
        // 曲线图宽高数据 - 在某个范围内绘制
        let graphWidth = width - margin * 2 - 4
        let graphHeight = height - topBorder - bottomBorder

        // 计算点X坐标的闭包 - 传入第几个点计算X坐标 - 计算出来的X坐标参照系为当前上下文rect而不是曲线图宽高构成的rect
        let columXPoint = { (column: Int) -> CGFloat in
            let spacing = graphWidth / CGFloat(self.graphPoints.count - 1)
            return CGFloat(column) * spacing + margin + 2
        }

        // 计算点Y坐标的闭包 - 最高值作为参照传入具体值获取相对应的高度Y - 计算出来的Y坐标参照系为当前上下文rect
        guard let maxValue = graphPoints.max() else { return }
        let columYPoint = { (value: Int) -> CGFloat in
            let yPoint = (CGFloat(value) / CGFloat(maxValue)) * graphHeight
            return topBorder + graphHeight - yPoint // 因为Core Graphics原点在左上角需要翻转
        }

        let graphPath = UIBezierPath()
        graphPath.lineWidth = 2.0
        graphPath.move(to: CGPoint(x: columXPoint(0), y: columYPoint(graphPoints[0])))
        for i in 1 ..< graphPoints.count {
            let nextPoint = CGPoint(x: columXPoint(i), y: columYPoint(graphPoints[i]))
            graphPath.addLine(to: nextPoint)
        }

        UIColor.red.setFill()
        UIColor.white.setStroke()
        context.saveGState() // 保存当前未裁剪的上下文状态防止下一步裁剪了导致数据点绘制出现不完整 - 可以注释掉context.saveGState()和context.restoreGState()查看绘制数据点被裁剪的奇怪状态

        // MARK: - 为折线图下方添加渐变

        guard let clippingPath = graphPath.copy() as? UIBezierPath else { return }
        clippingPath.addLine(to: CGPoint(x: columXPoint(graphPoints.count - 1), y: height)) // 添加到右下角的路径
        clippingPath.addLine(to: CGPoint(x: columXPoint(0), y: height)) // 添加到左下角的路径
        clippingPath.close() // 关闭两个端点
        clippingPath.addClip() // 将剪切路径添加到上下文,表示只填充裁剪路径包含的内容不然就成了填充整个上下文

        let graphaStartPoint = CGPoint(x: margin, y: columYPoint(maxValue))
        let graphEndPoint = CGPoint(x: margin, y: bounds.height)
        context.drawLinearGradient(gradient, start: graphaStartPoint, end: graphEndPoint, options: [])

        // MARK: - 恢复裁剪前的上下文状态并绘制折线 - 当设置各种上下文属性就相当于设置上下文状态如填充颜色/变换矩阵/颜色空间/裁剪区域等

        UIColor.blue.setFill()
        UIColor.green.setStroke()
        context.restoreGState() // 相当于上两句代码设置的上下文状态又被覆盖了所以点不是白色的且上下文也恢复成原来的没被折线路径裁剪过的上下文

        graphPath.stroke() // 到此绘制数据折线路径

        // MARK: - 绘制一个个数据点

        for i in 0 ..< graphPoints.count {
            var point = CGPoint(x: columXPoint(i), y: columYPoint(graphPoints[i]))
            point.x -= Constants.circleDiameter / 2
            point.y -= Constants.circleDiameter / 2

            let circle = UIBezierPath(ovalIn: CGRect(origin: point, size: .init(width: Constants.circleDiameter, height: Constants.circleDiameter)))
            circle.fill()
        }

        // MARK: - 绘制基准线

        let linePath = UIBezierPath()
        linePath.move(to: .init(x: margin, y: topBorder))
        linePath.addLine(to: .init(x: width - margin, y: topBorder))

        linePath.move(to: .init(x: margin, y: topBorder + graphHeight / 2))
        linePath.addLine(to: .init(x: width - margin, y: topBorder + graphHeight / 2))

        linePath.move(to: .init(x: margin, y: height - bottomBorder))
        linePath.addLine(to: .init(x: width - margin, y: height - bottomBorder))

        UIColor.white.withAlphaComponent(Constants.colorAlpha).setStroke()
        linePath.stroke()
    }
}
