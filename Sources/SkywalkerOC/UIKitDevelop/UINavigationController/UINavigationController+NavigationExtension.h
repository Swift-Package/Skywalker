//
//  UINavigationController+Navigation.h
//  
//
//  Created by 杨俊艺 on 2022/8/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (NavigationExtension)

- (void)popToTarget:(NSString *)viewControllerClassName;

- (void)filterTargetViewControllers:(NSArray<Class> *)classList;

@end

NS_ASSUME_NONNULL_END
