//
//  UIColor+HEXColor.h
//  
//
//  Created by 杨俊艺 on 2022/2/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (HEXColor)

/// 从十六进制字符串获取颜色
/// @param color 支持@#"123456"
+ (UIColor *)colorWithHexString:(NSString *)color;

/// 从十六进制字符串获取颜色
/// @param color 支持@#"123456" @"0X123456" @"123456"三种格式
/// @param alpha 透明度
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
