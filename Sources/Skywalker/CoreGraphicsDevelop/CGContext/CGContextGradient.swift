//
//  CGContextGradient.swift
//  
//
//  Created by 杨俊艺 on 2022/5/1.
//

import UIKit

public typealias Angle = Measurement<UnitAngle>

public extension CGContext {
    
    /// 从上到下在指定的矩形区域内绘制一层颜色渐变
    /// - Parameters:
    ///   - rect: 指定的矩形区域
    ///   - startColor: 开始颜色
    ///   - endColor: 结束颜色
    func drawLinearGradient(rect: CGRect, startColor: UIColor, endColor: UIColor) {
        saveGState()
        defer { restoreGState() }
        
        // 在上下文中裁剪出指定的矩形区域
        addRect(rect)
        clip()
        
        let gradient = CGGradient(colorsSpace: nil, colors: [startColor.cgColor, endColor.cgColor] as CFArray, locations: [0, 1])!
        let startPoint = CGPoint(x: rect.midX, y: rect.minY)
        let endPoint = CGPoint(x: rect.midX, y: rect.maxY)
        
        drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
    }
    
    /// 从上到下在指定的矩形区域内绘制一层颜色渐变并在上半部分添加一层光泽
    /// - Parameters:
    ///   - rect: 指定的矩形区域
    ///   - startColor: 开始颜色
    ///   - endColor: 结束颜色
    func drawGlossAndGradient(rect: CGRect, startColor: UIColor, endColor: UIColor) {
        drawLinearGradient(rect: rect, startColor: startColor, endColor: endColor)
        
        var topHalf = rect
        topHalf.size.height /= 2
        let glossColor1 = UIColor.white.withAlphaComponent(0.35)
        let glossColor2 = UIColor.white.withAlphaComponent(0.1)
        drawLinearGradient(rect: topHalf, startColor: glossColor1, endColor: glossColor2)
    }
    
    /// 在上下文中绘制一条1像素的线段
    /// - Parameters:
    ///   - startPoint: 线段起始点
    ///   - endPoint: 线段终点
    ///   - color: 线段颜色
    func draw1PxStroke(startPoint: CGPoint, endPoint: CGPoint, color: UIColor) {
        saveGState()
        defer { restoreGState() }
        
        setLineCap(.square)     // 设置在图形上下文中绘制的线的端点的样式
        move(to: startPoint)    // 移动到指定的点开始一条新路径
        addLine(to: endPoint)   // 从当前路径点添加一条到指定点的直线
        
        setLineWidth(1)
        setStrokeColor(color.cgColor)
        strokePath()
    }
    
    /// 从指定的矩形区域下方创建一个指定高度的用来容纳一条弧线路径的矩形
    /// - Parameters:
    ///   - rect: 指定的矩形
    ///   - arcHeight: 指定矩形下方的另一个矩形的高度
    ///   - startAngle: 起始角度
    ///   - endAngle: 结束角度
    /// - Returns: 弧线路径
    static func createArcPathFromBottom(of rect: CGRect, arcHeight: CGFloat, startAngle: Angle = Angle(degrees: 180), endAngle: Angle = Angle(degrees: 360)) -> CGPath {
        let arcRect = CGRect(x: rect.origin.x, y: rect.origin.y + rect.height, width: rect.width, height: arcHeight)
        let arcRadius = (arcRect.height + (pow(arcRect.width / 2, 2) / arcRect.height)) / 2               // 根据圆相交弦定理求出半径
        let arcCenter = CGPoint(x: arcRect.origin.x + arcRect.width / 2, y: arcRect.origin.y + arcRadius) // 圆心
        let angle = acos((arcRect.width / 2) / arcRadius)                                                 // 反余弦函数求出弧度
        
        let startAngle = CGFloat(startAngle.toRadians()) + angle
        let endAngle = CGFloat(endAngle.toRadians()) - angle
        
        let path = CGMutablePath.init()
        path.addArc(center: arcCenter, radius: arcRadius, startAngle: startAngle, endAngle: endAngle, clockwise: false)// 圆弧逆时针画所以先移动到指定的矩形左下角
        
        path.addLine(to: CGPoint (x: rect.maxX, y: rect.minY))// 指定的矩形左下角
        path.addLine(to: CGPoint (x: rect.minX, y: rect.minY))// 指定的矩形左上角
        path.addLine(to: CGPoint (x: rect.minY, y: rect.maxY))// 指定的矩形右上角
        
        return path.copy()!
    }
}
