//
//  NSString+Convert.m
//  
//
//  Created by 杨俊艺 on 2022/2/15.
//

#import "NSString+Convert.h"

@implementation NSString (Convert)

/// 十六进制的String为转换Data
- (NSData *)hexData {
    // 一个16进制字符需要半个字节的空间去存储
    unsigned char *buf = malloc(self.length / 2);
    unsigned char *whole_byte = buf;
    char byte_chars[3] = {'\0','\0','\0'};
    
    for (int i = 0; i < self.length / 2; i++) {
        byte_chars[0] = [self characterAtIndex:i * 2];
        byte_chars[1] = [self characterAtIndex:i * 2 + 1];
        *whole_byte = strtol(byte_chars, NULL, 16);
        whole_byte++;
    }
    
    NSData *data = [NSData dataWithBytes:buf length:self.length / 2];
    free(buf);
    return data;
}

@end
