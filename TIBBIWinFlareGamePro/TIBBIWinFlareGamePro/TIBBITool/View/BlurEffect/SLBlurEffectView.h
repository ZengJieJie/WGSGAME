//
//  SLBlurEffectView.h
//  Hydra
//
//  Created by LONG JUN on 2023/3/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/*
 设计图中常用的毛玻璃加透明度效果
 */
@interface SLBlurEffectView : UIView

#pragma mark - Public

/// 毛玻璃层
@property (nonatomic, readonly) UIVisualEffectView *effectView;
/// 覆盖层
@property (nonatomic, readonly) UIView *coverView;

/// 初始化
/// - Parameter effectStyle: 效果
- (instancetype)initWithEffectStyle:(UIBlurEffectStyle)effectStyle;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
