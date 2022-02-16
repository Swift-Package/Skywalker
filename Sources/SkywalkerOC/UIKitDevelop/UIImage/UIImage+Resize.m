//
//  UIImage+Resize.m
//
//
//  Created by 杨俊艺 on 2022/2/16.
//

#import "UIImage+Resize.h"

@implementation UIImage (Resize)

/// 指定压缩率重设图片大小
/// @param maxSize 大小
/// @param quality 压缩率
- (UIImage *)resizeWith:(CGSize)maxSize compression:(float)quality {
    float maxWidth = maxSize.width;
    float maxHeight = maxSize.height;
    float maxRatio = maxWidth / maxHeight;
    
    float actualWidth = self.size.width;
    float actualHeight = self.size.height;
    float imgRatio = actualWidth / actualHeight;
    
    if (actualHeight > maxHeight || actualWidth > maxWidth) {
        if (imgRatio < maxRatio) {
            imgRatio = maxHeight / actualHeight;
            actualWidth = imgRatio * actualWidth;
            actualHeight = maxHeight;
        } else if (imgRatio > maxRatio) {
            imgRatio = maxWidth / actualWidth;
            actualHeight = imgRatio * actualHeight;
            actualWidth = maxWidth;
        } else {
            actualHeight = maxHeight;
            actualWidth = maxWidth;
        }
    }

    CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
    UIGraphicsBeginImageContext(rect.size);
    [self drawInRect:rect];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    NSData *imageData = UIImageJPEGRepresentation(img, quality);
    UIGraphicsEndImageContext();

    return [UIImage imageWithData:imageData];
}

@end
