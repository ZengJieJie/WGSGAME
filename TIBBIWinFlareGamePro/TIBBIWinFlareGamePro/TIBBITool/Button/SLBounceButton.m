//
//  SLBounceButton.m
//  SangoLive
//
//  Created by 胡伟伟 on 2020/10/28.
//  Copyright © 2020 Sango. All rights reserved.
//

#import "SLBounceButton.h"


@interface SLBounceButton ()

@property (nonatomic,strong) CAGradientLayer *gradienLayer;

@end

@implementation SLBounceButton

+(instancetype)bounceButtonMake:(nullable void(^)(SLBounceButton *sender))completion{
    SLBounceButton *button = [SLBounceButton buttonWithType:UIButtonTypeCustom];
    if (completion)completion(button);
    return button;
}



-(CAGradientLayer *)gradienLayer{
    if (!_gradienLayer) {
        _gradienLayer = [CAGradientLayer layer];
        _gradienLayer.locations = @[@0,@1];
        _gradienLayer.startPoint = CGPointMake(0, 0);
        _gradienLayer.endPoint = CGPointMake(1, 0);
        _gradienLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,(__bridge id)[UIColor clearColor].CGColor];
    }
    return _gradienLayer;
}

-(void)bounceButtonMakeGradientLayer:(void(^)(CAGradientLayer *gradientLayer))makeCompletion{
    [self.layer insertSublayer:self.gradienLayer below:self.titleLabel.layer];
    if (makeCompletion)makeCompletion(self.gradienLayer);
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.gradienLayer.frame = self.bounds;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

//        [self actionSet];
        [self addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];

    }
    return self;
}
- (void)click
{
    if (self.didAction){
        self.didAction();
    }
    if (self.didActionRetrun){
        self.didActionRetrun(self);
    }
}
-(void)actionSet{
    [self addTarget:self action:@selector(beginTouch) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(beginTouch) forControlEvents:UIControlEventTouchDragInside];
    [self addTarget:self action:@selector(endTouch) forControlEvents:UIControlEventTouchUpInside];

    [self addTarget:self action:@selector(endTouch) forControlEvents:UIControlEventTouchUpOutside];

    [self addTarget:self action:@selector(endTouch) forControlEvents:UIControlEventTouchDragOutside];

    [self addTarget:self action:@selector(endTouch) forControlEvents:UIControlEventTouchCancel];
}
-(void)endTouch{
    self.isTouching = NO;
}
-(void)beginTouch{
    self.isTouching = YES;
}
-(void)setIsTouching:(BOOL)isTouching{
    _isTouching = isTouching;
    if (isTouching) {
//        if (@available(iOS 10.0, *)) {
//            UIImpactFeedbackGenerator *impactLight = [[UIImpactFeedbackGenerator alloc]initWithStyle:UIImpactFeedbackStyleLight];
//            [impactLight impactOccurred];
//        } else {
//            AudioServicesPlaySystemSound(1520);
//        }
        [UIView animateWithDuration:.28 animations:^{
            self.transform = CGAffineTransformMakeScale(1.08, 1.08);
        } completion:^(BOOL finished) {
            
        }];
    }else{
        [UIView animateWithDuration:.8 delay:0 usingSpringWithDamping:.35 initialSpringVelocity:1 options:1 animations:^{
            self.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            
        }];
    }
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self actionSet];
}



@end
