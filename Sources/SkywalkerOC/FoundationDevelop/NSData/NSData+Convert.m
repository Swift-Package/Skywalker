//
//  NSData+Convert.m
//  
//
//  Created by 杨俊艺 on 2022/2/15.
//

#import "NSData+Convert.h"

@implementation NSData (Convert)

- (int)decimalValue {
    uint32_t value = 0;
    [self getBytes:&value length:self.length];
    return (int)value;
}

- (float)floatValue {
    int32_t value;
    [self getBytes:&value length:self.length];
    float result;
    memcpy(&result, &value, sizeof(value));
    
    return result;
}

/// Data转换为十六进制的String
- (NSString *)hexString {
    Byte *bytes = (Byte *)[self bytes];
    // 下面是Byte 转换为16进制
    NSString *hexStr = @"";
    for(int i = 0; i < [self length]; i++) {
        NSString *newHexStr = [NSString stringWithFormat:@"%x", bytes[i] & 0xff];// 16进制数
        
        if ([newHexStr length] == 1) {
            hexStr = [NSString stringWithFormat:@"%@0%@", hexStr, newHexStr];
        } else {
            hexStr = [NSString stringWithFormat:@"%@%@", hexStr, newHexStr];
        }
    }
    return hexStr;
}

@end
