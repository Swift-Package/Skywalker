//
//  UIImage+Resize.h
//
//
//  Created by 杨俊艺 on 2022/2/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Resize)

/// 指定压缩率重设图片大小
/// @param maxSize 大小
/// @param quality 压缩率
- (UIImage *)resizeWith:(CGSize)maxSize compression:(float)quality;

- (UIImage *)scaleSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
