//
//  UIDevice+Language.h
//  
//
//  Created by 杨俊艺 on 2023/1/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (Language)

#pragma mark - 判断当前系统语言类型
+ (NSString *)currentLanguage;

#pragma mark - 判断当前系统语言是否为中文
+ (BOOL)currentLanguageIsChinese;

@end

NS_ASSUME_NONNULL_END
