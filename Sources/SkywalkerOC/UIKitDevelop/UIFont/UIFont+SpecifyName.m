//
//  UIFont+SpecifyName.m
//  
//
//  Created by 杨俊艺 on 2022/3/23.
//

#import "UIFont+SpecifyName.h"

@implementation UIFont (SpecifyName)

+ (UIFont *)normalFontWithSize:(CGFloat)size {
    return [self fontWithName:@"PingFangSC-Regular" size:size];
}

+ (UIFont *)boldFontWithSize:(CGFloat)size {
    return [self fontWithName:@"PingFangSC-Medium" size:size];
}

@end
