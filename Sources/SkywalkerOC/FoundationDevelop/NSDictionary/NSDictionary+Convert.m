//
//  NSDictionary+Convert.m
//  
//
//  Created by 杨俊艺 on 2022/3/23.
//

#import "NSDictionary+Convert.h"

@implementation NSDictionary (Convert)

/// 字典转换成的字符串
- (NSString *)jsonString {
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
