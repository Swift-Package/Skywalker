//
//  NSString+Convert.m
//  
//
//  Created by 杨俊艺 on 2022/2/15.
//

#import "NSString+Convert.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (Convert)

+ (NSString *)jsonStringFromData:(NSData *)data {
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

/// 十六进制的NSString为转换NSData不限制字符串字符总个数为双数单数字符串自动在最前面补0
- (NSData *)hexData {
    char byte_chars[3] = {'\0', '\0', '\0'};//最后一个'\0'作为字符串结束符
    
    if (self.length % 2 == 0) {
        unsigned char *buf = malloc(self.length / 2);// 一个十六进制字符需要半个字节的空间去存储
        unsigned char *whole_byte = buf;
        
        for (int i = 0; i < self.length / 2; i++) {
            byte_chars[0] = [self characterAtIndex:i * 2];
            byte_chars[1] = [self characterAtIndex:i * 2 + 1];
            *whole_byte = strtol(byte_chars, NULL, 16);
            whole_byte++;
        }
        
        NSData *data = [NSData dataWithBytes:buf length:self.length / 2];
        free(buf);
        return data;
    } else {
        unsigned char *buf = malloc(self.length + 1 / 2);// 一个十六进制字符需要半个字节的空间去存储
        unsigned char *whole_byte = buf;
        NSString *confirmStr = [[NSString stringWithFormat:@"0"] stringByAppendingString:self];
        for (int i = 0; i < confirmStr.length / 2; i++) {
            byte_chars[0] = [confirmStr characterAtIndex:i * 2];
            byte_chars[1] = [confirmStr characterAtIndex:i * 2 + 1];
            *whole_byte = strtol(byte_chars, NULL, 16);
            whole_byte++;
        }
        
        NSData *data = [NSData dataWithBytes:buf length:confirmStr.length / 2];
        free(buf);
        return data;
    }
}

/// 转换成MD5字符串不可逆
- (NSString *)md5String {
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    CC_MD5(cStr, (unsigned int)strlen(cStr), result);
#pragma clang diagnostic pop
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x", result[i]];
    }
    return ret;
}

/// 转换成Base64编码格式
- (NSString *)base64String {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64Str = [data base64EncodedStringWithOptions:0];
    return base64Str;
}

/// Base64编码格式还原
- (NSString *)base64ToOriginal {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSDictionary *)jsonToDictionary {
    if (self == nil) { return nil; }
    
    NSError *error;
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        return nil;
    }
    return dictionary;
}

@end
