//
//  UIView+BlurEffect.m
//  Hydra
//
//  Created by LONG JUN on 2023/3/27.
//

#import "UIView+BlurEffect.h"
#import "SLBlurEffectView.h"

@implementation UIView (BlurEffect)

- (SLBlurEffectView *)addLightBlurEffectView {
    SLBlurEffectView *effectView = [[SLBlurEffectView alloc] initWithEffectStyle:UIBlurEffectStyleLight];
    effectView.coverView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
    [self insertSubview:effectView atIndex:0];
    
    effectView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [effectView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [effectView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [effectView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    [effectView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    
    return effectView;
}

- (SLBlurEffectView *)addDarkBlurEffectView {
    SLBlurEffectView *effectView = [[SLBlurEffectView alloc] initWithEffectStyle:UIBlurEffectStyleDark];
    effectView.coverView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.05];
    [self insertSubview:effectView atIndex:0];
    
    effectView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [effectView.topAnchor constraintEqualToAnchor:self.topAnchor].active = YES;
    [effectView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor].active = YES;
    [effectView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor].active = YES;
    [effectView.trailingAnchor constraintEqualToAnchor:self.trailingAnchor].active = YES;
    
    return effectView;
}

@end
