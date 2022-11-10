//
//  NSString+Convert.h
//  
//
//  Created by 杨俊艺 on 2022/2/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Convert)

+ (NSString *)jsonStringFromData:(NSData *)data;

/// 十六进制的NSString为转换NSData不限制字符串字符总个数为双数单数字符串自动在最前面补0
- (NSData *)hexData;

/// 转换成MD5字符串不可逆
- (NSString *)md5String;

/// 转换成Base64编码格式
- (NSString *)base64String;

/// Base64编码格式还原
- (NSString *)base64ToOriginal;

- (NSDictionary *)jsonToDictionary;

@end

NS_ASSUME_NONNULL_END
