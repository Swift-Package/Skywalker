//
//  UIViewController+Navigation.h
//  
//
//  Created by 杨俊艺 on 2022/6/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Navigation)

- (void)popTo:(NSString *)viewControllerClassName;

@end

NS_ASSUME_NONNULL_END
