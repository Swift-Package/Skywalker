//
//  File.swift
//  
//
//  Created by 杨俊艺 on 2022/11/4.
//

import UIKit

public extension Data {
    /// 生成二维码图片
    /// - Returns: 可能为nil的二维码图片
    func generateQRCodeImage() -> UIImage? {
        let filter = CIFilter.init(name: "CIQRCodeGenerator")
        filter?.setValue(self, forKey: "InputMessage")
        
        if let transformedCIImage = filter?.outputImage?.transformed(by: .init(scaleX: 10, y: 10)) {
            return UIImage.init(ciImage: transformedCIImage)
        } else {
            return nil
        }
    }
    
    /// 生成条形码图片
    /// - Returns: 可能为nil的条形码图片
    func generateBarCodeImage() -> UIImage? {
        let filter = CIFilter.init(name: "CICode128BarcodeGenerator")
        filter?.setValue(self, forKey: "InputMessage")
        
        if let transformedCIImage = filter?.outputImage?.transformed(by: .init(scaleX: 10, y: 10)) {
            return UIImage.init(ciImage: transformedCIImage)
        } else {
            return nil
        }
    }
}
