//
//  SLUpDownSlidingTransition.m
//  SangoLive
//
//  Created by 周志官 on 2021/11/30.
//  Copyright © 2021 Sango. All rights reserved.
//

#import "SLUpDownSlidingTransition.h"

@interface SLUpDownSlidingTransition ()<UIGestureRecognizerDelegate>

/// 当前手势
@property(nonatomic, strong) UIPanGestureRecognizer *pan;

/// 是否已经发生改变
@property(nonatomic, assign) BOOL isChanged;

/// 引用
@property(nonatomic, strong) NSHashTable *scrollHashTable;

@end

@implementation SLUpDownSlidingTransition

- (void)addPanScrollView:(UIScrollView *)scrollView
{
    if (scrollView && [scrollView isKindOfClass:UIScrollView.class]) {
        [self.scrollHashTable addObject:scrollView];
    }
}

- (void)addPanGuesture:(UIView*)view{
    if (_pan) {
        return;
    }
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    pan.delegate = self;
    _pan = pan;
    [view addGestureRecognizer:pan];
}

- (void)handleGesture:(UIPanGestureRecognizer *)panGesture{
    CGPoint transPoint = [panGesture translationInView:panGesture.view];
    //计算滑动比例
    CGFloat rate = 0;
    if (transPoint.y > 0) {
        CGFloat height = panGesture.view.frame.size.height;
        rate = transPoint.y / height;
        rate = MIN(1.0f, rate);
    }else{
        _isChanged = NO;
    }
    
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            _isChanged = NO;
            _isDraging = YES;
            //手势开始是手动触发关闭页面才会触发转场动画
//            [MiKiGetCoreI(IViewControllerPort).currentViewController dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            //判断滚动视图是否可动
            CGPoint velocity = [panGesture velocityInView:panGesture.view];
            if ([self resolveSlidingConflictsPanVelocity:velocity]) {
                //根据比例控制动画完成度
                [self updateInteractiveTransition:rate];
                _isChanged = YES;
            } else {
                
            }
        }
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
        {
            //手势结束时，看情况是否可以视为完成操作
            if (rate >= 0.3 && _isChanged) {
                if (self.slideDismissHandle)self.slideDismissHandle();
                [self finishInteractiveTransition];
            }else{
                [self cancelInteractiveTransition];
            }
            _isDraging = NO;
            _isChanged = NO;
        }
            break;
        case UIGestureRecognizerStatePossible:
       
            break;
        case UIGestureRecognizerStateFailed:
    
            break;
    }
}

- (BOOL)resolveSlidingConflictsPanVelocity:(CGPoint)velocity
{
    __block BOOL canPan = YES;
    [self.scrollHashTable.allObjects enumerateObjectsUsingBlock:^(UIScrollView *scrollView, NSUInteger idx, BOOL * _Nonnull stop) {
        //如果scrollView>0 则打断pan, 说明scrollView在拖动，pan不能进行移动
        if ((scrollView.isDragging && scrollView.contentOffset.y > -scrollView.contentInset.top) && !_isChanged) {
            canPan = NO;
            *stop = YES;
        }
        
        if ((scrollView.isDragging && (scrollView.contentOffset.y <= -scrollView.contentInset.top && velocity.y > 0)) || _isChanged) {
            CGPoint point = scrollView.contentOffset;
            point.y = -scrollView.contentInset.top;
            scrollView.contentOffset = point;
        }
    }];
    
    return canPan;
}

#pragma mark --UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return !self.closeGesture;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer NS_AVAILABLE_IOS(7_0){
    //利用一下手势互斥 确定视图
    UIView *otherGestureRecognizerView = otherGestureRecognizer.view;
    if ([otherGestureRecognizerView isKindOfClass:[UIScrollView class]] && !self.scrollHashTable.count) {
        return YES;
    }
    return NO;
}

#pragma mark - get
- (NSHashTable *)scrollHashTable
{
    if (!_scrollHashTable) {
        _scrollHashTable = [NSHashTable weakObjectsHashTable];
    }
    return _scrollHashTable;
}

@end
