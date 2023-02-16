//
//  UIImageFilterExtensions.swift
//
//
//  Created by 杨俊艺 on 2022/2/20.
//

import UIKit

public enum Filter: String {
    case noir = "CIPhotoEffectNoir"

    var data: Data? {
        return rawValue.data(using: .utf8)
    }
}

@objc
public extension UIImage {
    /// 应用灰色滤镜后的图片
    var withTonalFilter: UIImage? {
        let context = CIContext(options: nil)
        let filter = CIFilter(name: "CIPhotoEffectTonal")
        let input = CoreImage.CIImage(image: self)
        filter?.setValue(input, forKey: kCIInputImageKey)

        guard let outputImage = filter?.outputImage,
              let outImage = context.createCGImage(outputImage, from: outputImage.extent)
        else { return nil }

        let returnImage = UIImage(cgImage: outImage)

        return returnImage
    }

    /// 应用滤镜生成新图片
    /// - Parameter filter: 滤镜选项
    /// - Returns: 应用滤镜生成的新图片
    @nonobjc func applyFilter(_ filter: Filter) -> UIImage? {
        let inputImage = CIImage(image: self)
        let filter = CIFilter(name: filter.rawValue)
        filter?.setValue(inputImage, forKey: "inputImage")

        guard let finalImage = filter?.outputImage else { return nil }
        guard let cgImage = CIContext().createCGImage(finalImage, from: finalImage.extent) else { return nil }
        return UIImage(cgImage: cgImage)
    }
}
