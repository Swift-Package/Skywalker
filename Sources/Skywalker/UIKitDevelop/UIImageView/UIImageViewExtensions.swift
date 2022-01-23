//
//  UIImageViewExtensions.swift
//  
//
//  Created by 杨俊艺 on 2022/1/23.
//

#if canImport(UIKit) && !os(watchOS)

import UIKit
import Photos

public extension UIImageView {
    // 从PHAsset中提取出图片并回调
  func fetchImageAsset(_ asset: PHAsset?, targetSize size: CGSize, contentMode: PHImageContentMode = .aspectFill, options: PHImageRequestOptions? = nil, completionHandler: ((Bool) -> Void)?) {
    
    guard let asset = asset else {
      completionHandler?(false)
      return
    }

    let resultHandler: (UIImage?, [AnyHashable : Any]?) -> Void = { image, info in
      self.image = image
      completionHandler?(true)
    }
    
    PHImageManager.default().requestImage(for: asset, targetSize: size, contentMode: contentMode, options: options, resultHandler: resultHandler)
  }
}

#endif

