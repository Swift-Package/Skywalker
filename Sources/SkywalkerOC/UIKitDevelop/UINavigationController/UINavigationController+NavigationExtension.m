//
//  UINavigationController+Navigation.m
//  
//
//  Created by 杨俊艺 on 2022/8/17.
//

#import "UINavigationController+NavigationExtension.h"

@implementation UINavigationController (NavigationExtension)

- (void)popToTarget:(NSString *)viewControllerClassName {
    NSArray *controllers = self.viewControllers;
    for (int i = 0; i < controllers.count; i++) {
         if ([controllers[i] isKindOfClass:NSClassFromString(viewControllerClassName)]) {
             [self popToViewController:controllers[i] animated:YES];
             break;
          }
    }
}

- (void)popToFirstTarget:(NSString *)viewControllerClassName {
    NSArray *controllers = self.viewControllers.reverseObjectEnumerator.allObjects;
    for (int i = 0; i < controllers.count; i++) {
         if ([controllers[i] isKindOfClass:NSClassFromString(viewControllerClassName)]) {
             [self popToViewController:controllers[i] animated:YES];
             break;
          }
    }
}

- (void)filterTargetViewControllers:(NSArray<Class> *)classList {
    NSMutableArray *childs = [NSMutableArray arrayWithArray:self.childViewControllers];
    
    UIViewController *lastController = childs.lastObject;
    [childs removeLastObject];
    
    [childs filterUsingPredicate:[NSPredicate predicateWithBlock:^BOOL (UIViewController *evaluatedObject, NSDictionary<NSString *, id> *_Nullable bindings) {
        Class class = evaluatedObject.class;
        BOOL flag = [classList containsObject:class];
        return !flag;
    }]];
    
    [childs addObject:lastController];
    
    [self setViewControllers:childs animated:NO];
}

@end
