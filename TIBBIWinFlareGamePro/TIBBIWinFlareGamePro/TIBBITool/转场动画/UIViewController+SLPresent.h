//
//  UIViewController+SLPresent.h
//  SangoLive
//
//  Created by 周志官 on 2021/11/30.
//  Copyright © 2021 Sango. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLUpDownSlidingAnimated.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (SLPresent)

@property(nonatomic, strong, readonly) SLUpDownSlidingAnimated *sl_upDownAnimated;

/// 模态自底部非全屏弹窗
/// - Parameters:
///   - viewControllerToPresent: 弹窗vc
///   - cornerRadius: 24
///   - completion: 模态完成回调
///   - unClickCoverBlock: 默认 点击遮罩关闭弹窗
///   - shouldPan: 支持滑动手势
///   - bgColor: 默认（#00000，0.6）
- (void)sl_presentUpDownViewController:(UIViewController *)viewControllerToPresent completion:(void (^ __nullable)(void))completion;

/// 模态自底部非全屏弹窗
/// - Parameters:
///   - viewControllerToPresent: 弹窗vc
///   - cornerRadius: 顶部圆角
///   - completion: 模态完成回调
///   - unClickCoverBlock: 默认 点击遮罩关闭弹窗
///   - shouldPan: 支持滑动手势
///   - bgColor: 默认（#00000，0.6）
- (void)sl_presentUpDownViewController:(UIViewController *)viewControllerToPresent
                          cornerRadius:(CGFloat)cornerRadius
                            completion:(void (^ __nullable)(void))completion;

/// 模态自底部非全屏弹窗
/// - Parameters:
///   - viewControllerToPresent: 弹窗vc
///   - cornerRadius: 24
///   - completion: 模态完成回调
///   - unClickCoverBlock: 自定义点击遮罩事件、nil时点击遮罩关闭弹窗
///   - shouldPan: 支持滑动手势
///   - bgColor: 默认（#00000，0.6）
-(void)sl_presentUpDownViewController:(UIViewController *)viewControllerToPresent completion:(void (^ __nullable)(void))completion  unClickCoverBlock:(BOOL(^ __nullable)(void))unClickCoverBlock;

/// 模态自底部非全屏弹窗
/// - Parameters:
///   - viewControllerToPresent: 弹窗vc
///   - cornerRadius: 无圆角
///   - completion: 模态完成回调
///   - unClickCoverBlock: 点击遮罩关闭弹窗
///   - shouldPan: 支持滑动手势
///   - bgColor: 默认（#00000，0.6）
- (void)sl_presentUpDownViewController:(UIViewController *)viewControllerToPresent bgColor:(nullable UIColor *)bgColor completion:(void (^ __nullable)(void))completion;

/// 模态自底部非全屏弹窗
/// - Parameters:
///   - viewControllerToPresent: 弹窗vc
///   - cornerRadius: 顶部圆角
///   - completion: 模态完成回调
///   - unClickCoverBlock: 自定义点击遮罩事件，实现此block，就会覆盖默认点击关闭弹窗
///   - shouldPan: 是否支持滑动手势
///   - bgColor: 默认（#00000，0.6）
- (void)sl_presentUpDownViewController:(UIViewController *)viewControllerToPresent
                          cornerRadius:(CGFloat)cornerRadius
                            completion:(void (^ __nullable)(void))completion
                     unClickCoverBlock:(BOOL(^ __nullable)(void))unClickCoverBlock
                             shouldPan:(BOOL)shouldPan;

/// 模态自底部非全屏弹窗
/// - Parameters:
///   - viewControllerToPresent: 弹窗vc
///   - cornerRadius: 顶部圆角
///   - completion: 模态完成回调
///   - unClickCoverBlock: 自定义点击遮罩事件，实现此block，就会覆盖默认点击关闭弹窗
///   - shouldPan: 是否支持滑动手势
///   - bgColor: 遮罩背景色 默认（#00000，0.6）
- (void)sl_presentUpDownViewController:(UIViewController *)viewControllerToPresent
                          cornerRadius:(CGFloat)cornerRadius
                            completion:(void (^ __nullable)(void))completion
                     unClickCoverBlock:(BOOL(^ __nullable)(void))unClickCoverBlock
                             shouldPan:(BOOL)shouldPan
                               bgColor:(nullable UIColor *)bgColor;

/// 指定弹窗上的scrollView (可以支持scrollView上下滑动联动)
/// - Parameter scrollView: scrollView
- (void)sl_upDownCurrentCanScrollView:(UIScrollView *)scrollView;

@end

NS_ASSUME_NONNULL_END
