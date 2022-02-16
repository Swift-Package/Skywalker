//
//  UIImage+Color.h
//  
//
//  Created by 杨俊艺 on 2022/2/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Color)

/// 生成纯色图片
/// @param color 颜色
+ (UIImage *)imageWithColor:(UIColor *)color;

/// 取图片某一像素的颜色
/// @param point 像素点位置
- (nullable UIColor *)colorAtPixel:(CGPoint)point;

/// 获取灰度图
- (nullable UIImage *)convertToGrayImage;

@end

NS_ASSUME_NONNULL_END
