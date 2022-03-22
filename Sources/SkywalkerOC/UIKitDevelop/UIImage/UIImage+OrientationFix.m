//
//  UIImage+OrientationFix.m
//  
//
//  Created by 杨俊艺 on 2022/2/24.
//

#import "UIImage+OrientationFix.h"

@implementation UIImage (OrientationFix)

- (UIImage *)imageWithFixedOrientation {
    if (self.imageOrientation == UIImageOrientationUp) return self;
  
    UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
    [self drawInRect:(CGRect){0, 0, self.size}];
    UIImage *normalizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return normalizedImage;
}

@end
