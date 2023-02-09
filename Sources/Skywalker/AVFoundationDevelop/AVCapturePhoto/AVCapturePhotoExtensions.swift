//
//  AVCapturePhotoExtensions.swift
//  
//
//  Created by 杨俊艺 on 2023/2/1.
//

import AVFoundation

public extension AVCapturePhoto {
    
    func stupidOSChangePreviewCGImageRepresentation() -> CGImage? {
        #if compiler(>=5.5)
        // 编译器版本跟随Xcode版本 5.5 iOS 15+ SDK, macOS 12+ SDK
        return self.previewCGImageRepresentation()
        #else
        return self.previewCGImageRepresentation()?.takeUnretainedValue()
        #endif
    }
}
