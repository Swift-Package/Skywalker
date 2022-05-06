//
//  UIImage+SpecialEffects.h
//  
//
//  Created by 杨俊艺 on 2022/5/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SpecialEffects)

/// 为UIImage对象设置透明度
/// @param alpha 透明度
- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
