//
//  SLIconButton.m
//  SangoLive
//
//  Created by LONG JUN on 2023/1/6.
//  Copyright © 2023 Sango. All rights reserved.
//

#import "SLIconButton.h"
#import "UILabel+Core.h"

@interface SLIconButton ()

/// 用来显示icon
@property (nonatomic, strong) UILabel *iconLabel;

@end

@implementation SLIconButton

#pragma mark - life cycle

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self didInitialize];
        [self initSubviews];
    }
    return self;
}

/// 布局
-(void)layoutSubviews{
    [super layoutSubviews];
}

#pragma mark - 初始化时调用的方法。
-(void)didInitialize{
    
}

#pragma mark - subviews的init
-(void)initSubviews{
    [self addSubview:self.iconLabel];
}

#pragma mark - Public

- (void)setIconFontWithText:(NSString *)text size:(CGFloat)size color:(UIColor *)color {
    [self.iconLabel mq_setIconFontWithText:text size:size color:color];
}

#pragma mark - event response

#pragma mark - private methods

#pragma mark - getters and setters

- (UILabel *)iconLabel {
    if (!_iconLabel) {
        _iconLabel = [[UILabel alloc] init];
        _iconLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _iconLabel;
}

@end
