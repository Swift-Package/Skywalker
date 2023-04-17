//
//  NSString+Verification.m
//  
//
//  Created by 杨俊艺 on 2022/2/23.
//

#import "NSString+Verification.h"
#import <sys/sysctl.h>
#import <SystemConfiguration/CaptiveNetwork.h>

@implementation NSString (Verification)

/// 是否是空字符串或者是空白字符组成的字符串
- (BOOL)isBlank {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length == 0;
}

/// 是否是合法手机号
/// - Parameter mobile: 手机号字符串
+ (BOOL)isValidateMobile:(NSString *)mobile {
    NSString *regex = @"^1(3[0-9]|4[57]|5[0-35-9]|66|8[0-9]|7[06-8])\\d{8}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:mobile];
}

@end
