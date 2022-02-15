//
//  SkywalkerGCDTimer.m
//  
//
//  Created by 杨俊艺 on 2022/1/24.
//

#import "SkywalkerGCDTimer.h"

@interface SkywalkerGCDTimer ()

@property (strong, nonatomic) dispatch_source_t timer;

@end

@implementation SkywalkerGCDTimer

+ (SkywalkerGCDTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats queue:(dispatch_queue_t)queue block:(void (^) (void))block {
    return [[SkywalkerGCDTimer alloc] initWithInterval:interval repeats:repeats queue:queue block:block];
}

- (instancetype)initWithInterval:(NSTimeInterval)interval repeats:(BOOL)repeats queue:(dispatch_queue_t)queue block:(void (^) (void))block {
    self = [super init];
    if (self) {
        self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
        dispatch_source_set_timer(self.timer, dispatch_time(DISPATCH_TIME_NOW, interval * NSEC_PER_SEC), interval * NSEC_PER_SEC, 0);
        dispatch_source_set_event_handler(self.timer, ^{
            if (!repeats) {
                dispatch_source_cancel(self.timer);
            }
            block();
        });
        dispatch_resume(self.timer);
    }
    return self;
}

- (void)dealloc {
    [self invalidate];
}

- (void)invalidate {
    if (self.timer) {
        dispatch_source_cancel(self.timer);
    }
}

@end

/**
 dispatch_source_set_timer第二个参数
    当使用dispatch_time或者DISPATCH_TIME_NOW时系统会使用默认时钟来进行计时然而当系统休眠的时候默认时钟是不走的也就会导致计时器停止
    当使用dispatch_walltime可以让计时器按照真实时间间隔进行计时
 dispatch_source_set_timer第四个参数
    指的是一个期望的容忍时间意味着系统有可能在定时器时间到达的前1秒或者后1秒才真正触发定时器在调用时推荐设置一个合理的leeway值
    需要注意就算指定0系统也无法保证完全精确的触发时间只是会尽可能满足这个需求
 
 dispatch_source_set_event_handler这个函数在执行完之后block会立马执行一遍后面隔一定时间间隔再执行一次而NSTimer第一次执行是到计时器触发之后这也是和NSTimer之间的一个显著区别
 
 停止Dispatch Timer有两种方法
    使用dispatch_source_cancel    真正意义上的取消Timer被取消之后如果想再次执行Timer只能重新创建新的Timer这个过程类似于对NSTimer执行invalidate
    使用dispatch_suspend          严格上只是把Timer暂时挂起它和dispatch_resume是一个平衡调用两者分别会减少和增加dispatch对象的挂起计数在挂起期间产生的事件会积累起来等到resume的时候会融合为一个事件发送
                                 需要注意的是dispatch source并没有提供用于检测source本身的挂起计数的API也就是说外部不能得知一个source当前是不是挂起状态在设计代码逻辑时需要考虑到这一点
 
 关于取消Timer另外一个很重要的注意事项dispatch_suspend之后的Timer是不能被释放的
 - (void)stopTimer {
    dispatch_suspend(_timer);
    _timer = nil; // EXC_BAD_INSTRUCTION崩溃
 }
 因此使用dispatch_suspend时Timer本身的实例需要一直保持而使用dispatch_source_cancel则没有这个限制
 - (void)stopTimer {
  dispatch_source_cancel(_timer);
  _timer = nil;
 }
 */
