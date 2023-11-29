//
//  NSString+QRCode.h
//  
//
//  Created by 杨俊艺 on 2023/5/6.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (QRCode)

- (UIImage *)generateQRCodeImageFor:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
