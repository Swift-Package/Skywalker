//
//  UINavigationController+Navigation.m
//  
//
//  Created by 杨俊艺 on 2022/8/17.
//

#import "UINavigationController+Navigation.h"

@implementation UINavigationController (Navigation)

- (void)popTo:(NSString *)viewControllerClassName {
    NSArray *controllers = self.viewControllers;
    for (int i = 0; i < controllers.count; i++) {
         if ([controllers[i] isKindOfClass:NSClassFromString(viewControllerClassName)]) {
             [self popToViewController:controllers[i] animated:YES];
             break;
          }
    }
}

@end
