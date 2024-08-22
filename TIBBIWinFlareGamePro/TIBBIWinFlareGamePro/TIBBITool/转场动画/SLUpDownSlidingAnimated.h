//
//  SLUpDownSlidingAnimated.h
//  SangoLive
//
//  Created by 周志官 on 2021/11/30.
//  Copyright © 2021 Sango. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLUpDownSlidingTransition.h"

NS_ASSUME_NONNULL_BEGIN

@interface SLUpDownSlidingAnimated : NSObject<UIViewControllerAnimatedTransitioning,UIViewControllerTransitioningDelegate>

/// 区分是呈现 or 关闭
@property(nonatomic, assign) BOOL isDiss;
/// 手势接管处理器
@property(nonatomic, strong) SLUpDownSlidingTransition *transition;
/// 转场动画容器视图
@property(nonatomic, strong, readonly) UIView *containerView;
/// 禁止点击遮罩
@property (nonatomic, copy) BOOL (^unClickCoverBlock)(void);

@property (nonatomic, copy) void(^tapDismissHandle)(void);

/// 遮罩背景色
/// [UIColor.blackColor colorWithAlphaComponent:0.6] - 默认#00000 0.6
@property(nonatomic, strong) UIColor *bgColor;


@end

NS_ASSUME_NONNULL_END
