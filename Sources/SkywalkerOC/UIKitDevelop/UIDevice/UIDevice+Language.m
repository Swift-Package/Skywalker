//
//  UIDevice+Language.m
//  
//
//  Created by 杨俊艺 on 2023/1/9.
//

#import "UIDevice+Language.h"

@implementation UIDevice (Language)

#pragma mark - 判断当前系统语言类型
+ (NSString *)currentLanguage {
    NSArray *allLanguages = [NSUserDefaults.standardUserDefaults objectForKey:@"AppleLanguages"];
    NSString *CURR_LANG = [allLanguages objectAtIndex:0];
    
    NSString *currentLanguage = [NSUserDefaults.standardUserDefaults objectForKey:@"currentLanguage"];
    if (currentLanguage != nil && currentLanguage && currentLanguage.length > 0) {
        CURR_LANG = currentLanguage;
    } else if ([CURR_LANG hasPrefix:@"zh"] ) {
        CURR_LANG = @"zh-CN";
    } else {
        CURR_LANG = @"en-US";
    }
    
    return CURR_LANG;
}

#pragma mark - 判断当前系统语言是否为中文
+ (BOOL)currentLanguageIsChinese {
    NSString *preferredLang = [UIDevice currentLanguage];
    return [preferredLang rangeOfString:@"zh"].location != NSNotFound;
}

@end
