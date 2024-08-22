//
//  UIViewController+SLPresent.m
//  SangoLive
//
//  Created by 周志官 on 2021/11/30.
//  Copyright © 2021 Sango. All rights reserved.
//

#import "UIViewController+SLPresent.h"
#import <objc/runtime.h>

@implementation UIViewController (SLPresent)

-(void)sl_presentUpDownViewController:(UIViewController *)viewControllerToPresent completion:(void (^ __nullable)(void))completion  unClickCoverBlock:(BOOL(^ __nullable)(void))unClickCoverBlock{
    [self sl_presentUpDownViewController:viewControllerToPresent cornerRadius:24.f completion:completion unClickCoverBlock:unClickCoverBlock];
}

- (void)sl_presentUpDownViewController:(UIViewController *)viewControllerToPresent
                          cornerRadius:(CGFloat)cornerRadius
                            completion:(void (^ __nullable)(void))completion
                     unClickCoverBlock:(BOOL(^ __nullable)(void))unClickCoverBlock{
    [self sl_presentUpDownViewController:viewControllerToPresent cornerRadius:cornerRadius completion:completion unClickCoverBlock:unClickCoverBlock shouldPan:YES bgColor:nil];
}

- (void)sl_presentUpDownViewController:(UIViewController *)viewControllerToPresent completion:(void (^ __nullable)(void))completion{
    [self sl_presentUpDownViewController:viewControllerToPresent cornerRadius:24.0f completion:completion];
}

- (void)sl_presentUpDownViewController:(UIViewController *)viewControllerToPresent
                          cornerRadius:(CGFloat)cornerRadius
                            completion:(void (^ __nullable)(void))completion {
    [self sl_presentUpDownViewController:viewControllerToPresent cornerRadius:cornerRadius completion:completion unClickCoverBlock:nil];
}

- (void)sl_presentUpDownViewController:(UIViewController *)viewControllerToPresent bgColor:(UIColor *)bgColor completion:(void (^ __nullable)(void))completion
{
    [self sl_presentUpDownViewController:viewControllerToPresent cornerRadius:0 completion:completion unClickCoverBlock:nil shouldPan:YES bgColor:bgColor];
}

- (void)sl_presentUpDownViewController:(UIViewController *)viewControllerToPresent
                          cornerRadius:(CGFloat)cornerRadius
                            completion:(void (^ __nullable)(void))completion
                     unClickCoverBlock:(BOOL(^ __nullable)(void))unClickCoverBlock
                             shouldPan:(BOOL)shouldPan
{
    [self sl_presentUpDownViewController:viewControllerToPresent cornerRadius:cornerRadius completion:completion unClickCoverBlock:unClickCoverBlock shouldPan:shouldPan bgColor:nil];
}

- (void)sl_presentUpDownViewController:(UIViewController *)viewControllerToPresent
                          cornerRadius:(CGFloat)cornerRadius
                            completion:(void (^ __nullable)(void))completion
                     unClickCoverBlock:(BOOL(^ __nullable)(void))unClickCoverBlock
                             shouldPan:(BOOL)shouldPan
                               bgColor:(nullable UIColor *)bgColor
{
    if (cornerRadius > 0) {
        //添加圆角
        viewControllerToPresent.view.layer.cornerRadius = cornerRadius;
        viewControllerToPresent.view.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
        viewControllerToPresent.view.layer.masksToBounds = YES;
    }
   
    if (shouldPan) {
        //添加手势
        [viewControllerToPresent.sl_upDownAnimated.transition addPanGuesture:viewControllerToPresent.view];
    }
    if (bgColor) {
        // 添加遮罩颜色
        viewControllerToPresent.sl_upDownAnimated.bgColor = bgColor;
    }
    
    viewControllerToPresent.sl_upDownAnimated.unClickCoverBlock = unClickCoverBlock;
    viewControllerToPresent.transitioningDelegate = viewControllerToPresent.sl_upDownAnimated;
    viewControllerToPresent.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:viewControllerToPresent animated:YES completion:completion];
}

- (void)sl_upDownCurrentCanScrollView:(UIScrollView *)scrollView
{
    [self.sl_upDownAnimated.transition addPanScrollView:scrollView];
}

static char kAssociatedObjectKey_sl_upDownAnimated;

-(void)setSl_upDownAnimated:(SLUpDownSlidingAnimated *)sl_upDownAnimated{
    objc_setAssociatedObject(self, &kAssociatedObjectKey_sl_upDownAnimated, sl_upDownAnimated, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(SLUpDownSlidingAnimated *)sl_upDownAnimated{
    SLUpDownSlidingAnimated *obj = objc_getAssociatedObject(self, &kAssociatedObjectKey_sl_upDownAnimated);
    if (obj == nil) {
        obj = [SLUpDownSlidingAnimated new];
        self.sl_upDownAnimated = obj;
    }
    return obj;
}


@end
