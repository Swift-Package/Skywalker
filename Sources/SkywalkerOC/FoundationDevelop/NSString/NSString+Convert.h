//
//  NSString+Convert.h
//  
//
//  Created by 杨俊艺 on 2022/2/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Convert)

/// 十六进制的String为转换Data
- (NSData *)hexData;

@end

NS_ASSUME_NONNULL_END
