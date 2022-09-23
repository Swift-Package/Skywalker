//
//  UIButton+Delay.m
//  
//
//  Created by 杨俊艺 on 2022/1/22.
//

#import "UIButton+Delay.h"
#import <objc/runtime.h>

#define defaultInteral  @"1"    // 倒计时时间

@interface UIButton ()

@property (nonatomic, assign) NSInteger delayInterval;  // 设置点击时间间隔
@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation UIButton (Delay)

- (void)sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    NSLog(@"Skywalker UIButton+Delay点击了");
    if (!self.isNeedDelay) {
        [super sendAction:action to:target forEvent:event];
        return;
    }
    if (!self.userInteractionEnabled) {
        return;
    }
    [super sendAction:action to:target forEvent:event];
    self.userInteractionEnabled = NO;
    self.delayInterval = [defaultInteral integerValue];
    if (self.timer) {
        dispatch_source_cancel(self.timer);
        self.timer = nil;
    }
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    if (!self.timer) {
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    }
    dispatch_source_set_timer(self.timer, dispatch_walltime(NULL, 0), 0.5 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(self.timer, ^{
        if (self.delayInterval==0) { //倒计时结束，关闭
            dispatch_source_cancel(self.timer);
            self.timer = nil;
            dispatch_async(dispatch_get_main_queue(), ^{
               self.userInteractionEnabled = YES;
            });
        } else {
            self.delayInterval--;
            NSLog(@"Skywalker UIButton+Delay倒计时");
            return;
        }
    });
    dispatch_resume(self.timer);
}

- (NSInteger)delayInterval {
    return [objc_getAssociatedObject(self, _cmd) integerValue];
}

- (void)setDelayInterval:(NSInteger)delayInterval {
    objc_setAssociatedObject(self, @selector(delayInterval), @(delayInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (dispatch_source_t)timer {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTimer:(dispatch_source_t)timer {
    objc_setAssociatedObject(self, @selector(timer), timer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)setIsNeedDelay:(BOOL)isNeedDelay {
    objc_setAssociatedObject(self, @selector(isNeedDelay), @(isNeedDelay), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isNeedDelay {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

@end
