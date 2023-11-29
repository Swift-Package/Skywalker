//
//  PDFToUIImage.swift
//
//
//  Created by 杨俊艺 on 2023/9/7.
//

import PDFKit
import UIKit

public extension URL {
    /// 将指定路径的PDF文档的第一页转换成图片
    /// - Returns: 第一页转换成的图片
    func convertFirstPageToUIImage() -> UIImage? {
        guard let document = CGPDFDocument(self as CFURL) else { return nil }
        guard let page = document.page(at: 1) else { return nil }

        let pageRect = page.getBoxRect(.mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
        let img = renderer.image { ctx in
            UIColor.white.set()
            ctx.fill(pageRect)
            ctx.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
            ctx.cgContext.scaleBy(x: 1.0, y: -1.0)
            ctx.cgContext.drawPDFPage(page)
        }
        return img
    }

    /// 将指定路径的PDF文档所有页面转换成图片并保存在缓存文件夹内
    /// - Returns: 所有图片路径
    func convertPDFToImageSaveInCache() -> [String] {
        var array = [String]()
        let pdf = CGPDFDocument(self as CFURL)!

        for index in 1 ... pdf.numberOfPages {
            if let page = pdf.page(at: index) {
                let frame = page.getBoxRect(.mediaBox)
                UIGraphicsBeginImageContext(CGSizeMake(600, 600 * (frame.size.height / frame.size.width)))

                guard let ctx = UIGraphicsGetCurrentContext() else { continue }

                ctx.saveGState()
                ctx.translateBy(x: 0.0, y: frame.size.height)
                ctx.scaleBy(x: 1.0, y: -1.0)
                ctx.setFillColor(gray: 1.0, alpha: 1.0)
                ctx.fill([frame])
                let pdfTransform = page.getDrawingTransform(.mediaBox, rect: frame, rotate: 0, preserveAspectRatio: true)
                ctx.concatenate(pdfTransform)
                ctx.interpolationQuality = .high
                ctx.setRenderingIntent(.defaultIntent)
                ctx.drawPDFPage(page)

                let thumbnailImage = UIGraphicsGetImageFromCurrentImageContext()

                ctx.restoreGState()

                var documentsPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).last!
                documentsPath = documentsPath.appending(String(format: "/Page%d.png", index))

                UIGraphicsEndImageContext()
                let imagedata = thumbnailImage?.pngData()
                try? imagedata?.write(to: URL(fileURLWithPath: documentsPath), options: .atomic)

                array.append(documentsPath)
            }
        }
        return array
    }
}
