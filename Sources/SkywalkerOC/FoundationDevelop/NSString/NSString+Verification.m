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

@end
