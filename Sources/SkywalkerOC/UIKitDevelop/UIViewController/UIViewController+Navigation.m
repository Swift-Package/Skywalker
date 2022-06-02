//
//  UIViewController+Navigation.m
//  
//
//  Created by 杨俊艺 on 2022/6/1.
//

#import "UIViewController+Navigation.h"

@implementation UIViewController (Navigation)

- (void)popTo:(NSString *)viewControllerClassName {
    NSArray *controllers = self.navigationController.viewControllers;
    for (int i = 0; i < controllers.count; i++) {
         if ([controllers[i] isKindOfClass:NSClassFromString(viewControllerClassName)]) {
             [self.navigationController popToViewController:controllers[i] animated:YES];
             break;
          }
    }
}

@end
