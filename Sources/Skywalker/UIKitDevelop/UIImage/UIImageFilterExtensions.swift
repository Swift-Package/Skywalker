//
//  UIImageFilterExtensions.swift
//  
//
//  Created by 杨俊艺 on 2022/2/20.
//

import UIKit

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
    
}
