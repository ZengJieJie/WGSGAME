//
//  SLUpDownSlidingAnimated.m
//  SangoLive
//
//  Created by 周志官 on 2021/11/30.
//  Copyright © 2021 Sango. All rights reserved.
//

#import "SLUpDownSlidingAnimated.h"

@interface SLUpDownSlidingAnimated()
/// 转场动画容器视图
@property(nonatomic, strong, readwrite) UIView *containerView;

@end

@implementation SLUpDownSlidingAnimated

- (instancetype)init
{
    self = [super init];
    if (self) {
        _transition = [SLUpDownSlidingTransition new];
    }
    return self;
}

/// 非手势交互 present
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self;
}

/// 非手势交互 dismiss
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    _isDiss = YES;
    return self;
}

/// 手势交互 dismiss
- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    //这里要注意，判断到是手势交互才返回代理
    return  _transition.isDraging ? _transition : nil;
}

/// 手势交互 present
- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator{
    return  nil;
}


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.3;
}

// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    if (_isDiss) {
        [self doDissAnimated:transitionContext];
        return;
    }
    [self doPresentAnimated:transitionContext];
}

- (void)doPresentAnimated:(id <UIViewControllerContextTransitioning>)transitionContext{
    //场景
    //UIViewController *formScene = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toScene   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //容器
    UIView *containerView = [transitionContext containerView];
    self.containerView = containerView;
    //中间背景
    UIView *bgView = [UIView new];
    if (self.bgColor) {
        bgView.backgroundColor = self.bgColor;
    } else {
        bgView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.6];
    }
    bgView.frame = containerView.frame;
    bgView.tag = 1002;
    bgView.alpha = 0;
    [bgView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickBgAction)]];
    //添加显示
    [containerView addSubview:bgView];
    [containerView addSubview:toScene.view];
    CGFloat height = toScene.preferredContentSize.height;
    toScene.view.frame = CGRectMake(0, CGRectGetHeight(containerView.frame), CGRectGetWidth(containerView.frame), height);
    //时间
    NSTimeInterval time = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:time animations:^{
        toScene.view.transform = CGAffineTransformMakeTranslation(0, -height);
        bgView.alpha = 1.0f;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

- (void)doDissAnimated:(id <UIViewControllerContextTransitioning>)transitionContext{
    //场景
    UIViewController *formScene = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //UIViewController *toScene   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //容器
    UIView *containerView = [transitionContext containerView];
    UIView *bgView = [containerView viewWithTag:1002];
    //曲线
    UIViewAnimationOptions option = UIViewAnimationOptionCurveEaseInOut;
    if (_transition.isDraging) {
        option = UIViewAnimationOptionCurveLinear;
    }
    //时间
    NSTimeInterval time = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:time delay:0 options:option animations:^{
        formScene.view.transform = CGAffineTransformIdentity;
        bgView.alpha = 0;
    } completion:^(BOOL finished) {
        //判断手势是否完成
        BOOL isCancel = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!isCancel];
        if (isCancel) {
            bgView.alpha = 1;
            return;
        }
        [bgView removeFromSuperview];
    }];
    
}

/// 点击背景关闭
- (void)clickBgAction{
//    if (self.unClickCoverBlock && self.unClickCoverBlock()) return;
//    [MiKiGetCoreI(IViewControllerPort).currentViewController dismissViewControllerAnimated:YES completion:^{
//        if (self.tapDismissHandle) self.tapDismissHandle();
//    }];
}

@end
