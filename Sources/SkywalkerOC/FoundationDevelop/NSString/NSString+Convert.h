//
//  NSString+Convert.h
//  
//
//  Created by 杨俊艺 on 2022/2/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Convert)

/// 十六进制的NSString为转换NSData其中字符串中的字符个数为双数
- (NSData *)hexData;

/// 转换成MD5字符串不可逆
- (NSString *)md5String;

/// 转换成Base64编码格式
- (NSString *)base64String;

/// Base64编码格式还原
- (NSString *)base64ToOriginal;

+ (NSString *)jsonStringFromData:(NSData *)data;

- (NSDictionary *)jsonToDictionary;

@end

NS_ASSUME_NONNULL_END
