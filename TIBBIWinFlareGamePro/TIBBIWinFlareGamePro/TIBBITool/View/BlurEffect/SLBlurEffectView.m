//
//  SLBlurEffectView.m
//  Hydra
//
//  Created by LONG JUN on 2023/3/27.
//

#import "SLBlurEffectView.h"

@interface SLBlurEffectView ()

/// 毛玻璃层
@property (nonatomic, strong) UIVisualEffectView *effectView;
/// 覆盖层
@property (nonatomic, strong) UIView *coverView;

@end

@implementation SLBlurEffectView


#pragma mark - life cycle

/// layoutSubviews
- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.effectView.frame = self.bounds;
    self.coverView.frame = self.bounds;
}

/// 初始化
/// - Parameter frame: frame description
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self didInitialize];
        [self initSubviews];
    }
    return self;
}

- (instancetype)initWithEffectStyle:(UIBlurEffectStyle)effectStyle {
    self.effectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:effectStyle]];
    return [self initWithFrame:CGRectZero];
}

/// 初始化view
-(void)initSubviews{
    [self addSubview:self.effectView];
    [self addSubview:self.coverView];
}

/// 初始化
-(void)didInitialize{
    
}

#pragma mark - Properys 属性懒加载 请写这里

- (UIView *)coverView {
    if (!_coverView) {
        _coverView = [[UIView alloc] init];
        _coverView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
    }
    return _coverView;
}

@end
