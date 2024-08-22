//
//  SLUpDownSlidingTransition.h
//  SangoLive
//
//  Created by 周志官 on 2021/11/30.
//  Copyright © 2021 Sango. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SLUpDownSlidingTransition : UIPercentDrivenInteractiveTransition

/// 是否正在拖动
@property(nonatomic, assign) BOOL isDraging;
/// 是否关闭手势
@property (nonatomic,assign) BOOL closeGesture;

// dissMiss call back
@property (nonatomic, copy) void(^slideDismissHandle)(void);

// 添加滑动手势
- (void)addPanGuesture:(UIView*)view;

- (void)addPanScrollView:(UIScrollView *)scrollView;

@end

NS_ASSUME_NONNULL_END
