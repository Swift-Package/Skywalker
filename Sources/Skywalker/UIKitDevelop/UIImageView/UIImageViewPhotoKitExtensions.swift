//
//  UIImageViewPhotoKitExtensions.swift
//
//
//  Created by 杨俊艺 on 2022/2/24.
//

#if canImport(UIKit) && !os(watchOS)

    import Photos
    import UIKit

    @objc
    public extension UIImageView {
        /// 从PHAsset中提取出图片并回调提取成功与否
        /// - Parameters:
        ///   - asset: PHAsset
        ///   - size: 图片大小
        ///   - contentMode: 内容模式
        ///   - options: 提取选项
        ///   - completionHandler: 成功与否回调
        func fetchImageAsset(_ asset: PHAsset?, targetSize size: CGSize, contentMode: PHImageContentMode = .aspectFill, options: PHImageRequestOptions? = nil, completionHandler: ((Bool) -> Void)?) {
            guard let asset = asset else {
                completionHandler?(false)
                return
            }

            let resultHandler: (UIImage?, [AnyHashable: Any]?) -> Void = { image, _ in
                self.image = image
                completionHandler?(true)
            }

            PHImageManager.default().requestImage(for: asset, targetSize: size, contentMode: contentMode, options: options, resultHandler: resultHandler)
        }
    }

#endif
