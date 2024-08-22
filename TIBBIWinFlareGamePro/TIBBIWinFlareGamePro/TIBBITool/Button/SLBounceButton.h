//
//  SLBounceButton.h
//  SangoLive
//
//  Created by 胡伟伟 on 2020/10/28.
//  Copyright © 2020 Sango. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SLBounceButton : UIButton

@property (nonatomic,assign) BOOL isTouching;

/**
 *  点击回调
 */
@property (nonatomic,copy) void(^didAction)(void);
/**
 *  点击回调,带self
 */
@property (nonatomic,copy) void(^didActionRetrun)(UIButton *button);

-(void)endTouch; //可手动触发

-(void)bounceButtonMakeGradientLayer:(void(^)(CAGradientLayer *gradientLayer))makeCompletion;

//@property (nonatomic,assign) CGFloat radius;
+(instancetype)bounceButtonMake:(nullable void(^)(SLBounceButton *sender))completion;


@end

NS_ASSUME_NONNULL_END
