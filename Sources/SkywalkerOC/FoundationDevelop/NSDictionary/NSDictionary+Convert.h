//
//  NSDictionary+Convert.h
//  
//
//  Created by 杨俊艺 on 2022/3/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Convert)

/// 字典转换成的字符串
- (NSString *)jsonString;

@end

NS_ASSUME_NONNULL_END
