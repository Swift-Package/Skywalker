//
//  StringQRCode.swift
//  
//
//  Created by 杨俊艺 on 2022/11/4.
//

import Foundation
import UIKit

public extension String {
    
    /// 生成二维码图片
    /// - Returns: 可能为nil的二维码图片
    func generateQRCodeImage() -> UIImage? {
        let data = self.data(using: .ascii, allowLossyConversion: false)
        let filter = CIFilter.init(name: "CIQRCodeGenerator")
        filter?.setValue(data, forKey: "InputMessage")
        
        if let transformedCIImage = filter?.outputImage?.transformed(by: .init(scaleX: 10, y: 10)) {
            return UIImage.init(ciImage: transformedCIImage)
        } else {
            return nil
        }
    }
    
    /// 生成条形码图片
    /// - Returns: 可能为nil的二维码图片
    func generateBarCodeImage() -> UIImage? {
        let data = self.data(using: .ascii, allowLossyConversion: false)
        let filter = CIFilter.init(name: "CICode128BarcodeGenerator")
        filter?.setValue(data, forKey: "InputMessage")
        
        if let transformedCIImage = filter?.outputImage?.transformed(by: .init(scaleX: 10, y: 10)) {
            return UIImage.init(ciImage: transformedCIImage)
        } else {
            return nil
        }
    }
}
