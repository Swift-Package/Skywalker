//
//  UILabel+YBAttributeTextTapAction.h
//  
//
//  Created by 杨俊艺 on 2022/2/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YBAttributeTapActionDelegate <NSObject>
@optional

/// YBAttributeTapActionDelegate
/// @param label 点击的文本标签
/// @param string 点击的字符串
/// @param range 点击的字符串Range
/// @param index 点击的字符在数组中的index
- (void)yb_tapAttributeInLabel:(UILabel *)label string:(NSString *)string range:(NSRange)range index:(NSInteger)index;

@end


@interface UILabel (YBAttributeTextTapAction)

/// 是否打开点击效果默认打开
@property (nonatomic, assign) BOOL enabledTapEffect;

/// 点击高亮色 默认是[UIColor lightGrayColor] 需打开enabledTapEffect才有效
@property (nonatomic, strong) UIColor *tapHighlightedColor;

/// 是否扩大点击范围默认打开
@property (nonatomic, assign) BOOL enlargeTapArea;

/// 给文本添加点击事件Block回调
/// @param strings 需要添加的字符串数组
/// @param tapClick 点击事件回调
- (void)yb_addAttributeTapActionWithStrings:(NSArray <NSString *> *)strings tapClicked:(void (^) (UILabel *label, NSString *string, NSRange range, NSInteger index))tapClick;

/// 给文本添加点击事件delegate回调
/// @param strings 需要添加的字符串数组
/// @param delegate 委托对象
- (void)yb_addAttributeTapActionWithStrings:(NSArray <NSString *> *)strings delegate:(id <YBAttributeTapActionDelegate>)delegate;

/// 根据Range给文本添加点击事件Block回调
/// @param ranges 需要添加的Range字符串数组
/// @param tapClick 点击事件回调
- (void)yb_addAttributeTapActionWithRanges:(NSArray <NSString *> *)ranges tapClicked:(void (^) (UILabel *label, NSString *string, NSRange range, NSInteger index))tapClick;

/// 根据Range给文本添加点击事件delegate回调
/// @param ranges 需要添加的Range字符串数组
/// @param delegate 委托对象
- (void)yb_addAttributeTapActionWithRanges:(NSArray <NSString *> *)ranges delegate:(id <YBAttributeTapActionDelegate>)delegate;

/// 删除label上的点击事件
- (void)yb_removeAttributeTapActions;

@end

NS_ASSUME_NONNULL_END
