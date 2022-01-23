//
//  UIImageExtensions.swift
//  
//
//  Created by 杨俊艺 on 2022/1/23.
//

#if canImport(UIKit) && !os(watchOS)

import UIKit

@objc
public extension UIImage {
    /// 生成指定大小的新图片
    /// - Parameter newSize: 大小
    /// - Returns: 新图片
    func thumbnailOfSize(_ newSize: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: newSize)
        let thumbnail = renderer.image {_ in
            draw(in: CGRect.init(origin: CGPoint.zero, size: newSize))
        }
        return thumbnail
  }
}

#endif
