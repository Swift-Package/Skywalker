//
//  NSString+Verification.h
//  
//
//  Created by 杨俊艺 on 2022/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Verification)

/// 是否是空字符串或者是空白字符组成的字符串
- (BOOL)isBlank;

@end

NS_ASSUME_NONNULL_END
