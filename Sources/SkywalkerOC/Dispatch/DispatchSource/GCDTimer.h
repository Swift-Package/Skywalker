//
//  GCDTimer.h
//  
//
//  Created by 杨俊艺 on 2022/1/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GCDTimer : NSObject

/// 初始化一个定时器并间隔时间之后开始触发
/// @param interval 间隔时间
/// @param repeats 是否重复触发
/// @param queue 调度队列一般传入主队列
/// @param block 定时器需要触发的动作
+ (GCDTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats queue:(dispatch_queue_t)queue block:(void (^) (void))block;

- (void)invalidate;

@end

NS_ASSUME_NONNULL_END
