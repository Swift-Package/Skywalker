//
//  PushButton.swift
//  
//
//  Created by 杨俊艺 on 2022/4/28.
//

import UIKit

/// 加号或减号按钮
@IBDesignable
@objcMembers
public class PushButton: UIButton {
    
    private struct Constants {
        static let plusLineWidth: CGFloat = 3.0     // 线宽
        static let plusButtonScale: CGFloat = 0.6   // 线段长度占据的比例
        static let halfPointShift: CGFloat = 0.5    // 为了解决3倍率屏幕绘制时出现的半点偏移
    }
    
    private var halfWidth: CGFloat { bounds.width / 2 }
    
    private var halfHeight: CGFloat { bounds.height / 2 }
    
    // 需要明确指定类型给IB解析可以直接在属性面板进行操作
    @IBInspectable var isAddButton: Bool = true
    @IBInspectable var fillColor: UIColor = .green
    
    public override func draw(_ rect: CGRect) {
        // 绘制圆底
        let path = UIBezierPath.init(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        UIColor.white.setStroke()
        // 加号线条占据的正方形边长即线条占据整个视图的比例
        let plusWidth = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        let plusPath = UIBezierPath.init()
            plusPath.lineWidth = Constants.plusLineWidth
        // 移动到书写加号的第一笔所在的点
            plusPath.move(to: CGPoint.init(x: halfWidth - halfPlusWidth + Constants.halfPointShift, y: halfHeight + Constants.halfPointShift))
        // 画出横线
            plusPath.addLine(to: CGPoint.init(x: halfWidth + halfPlusWidth + Constants.halfPointShift, y: halfHeight + Constants.halfPointShift))
        // 如果是加号再画一条竖线
        if isAddButton {
            plusPath.move(to: CGPoint.init(x: halfWidth + Constants.halfPointShift, y: halfHeight - halfPlusWidth + Constants.halfPointShift))
            plusPath.addLine(to: CGPoint.init(x: halfWidth + Constants.halfPointShift, y: halfHeight + halfPlusWidth + Constants.halfPointShift))
        }
        
        plusPath.stroke()
    }
    
}
