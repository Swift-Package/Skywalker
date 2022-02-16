//
//  NSData+Convert.h
//  
//
//  Created by 杨俊艺 on 2022/2/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (Convert)

- (int)decimalValue;

- (float)floatValue;

/// NSData转换为十六进制的全小写NSString
- (NSString *)hexString;

@end

NS_ASSUME_NONNULL_END
