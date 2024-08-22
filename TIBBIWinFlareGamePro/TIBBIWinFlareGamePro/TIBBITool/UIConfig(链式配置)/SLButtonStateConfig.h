//
//  SLButtonStateConfig.h
//  SangoLive
//
//  Created by YJExpand on 2020/9/22.
//  Copyright © 2020 Sango. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLViewConfigMaker.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SLButtonStateConfigDelegate <NSObject>

- (UIButton *)currentView;

@end

@interface SLButtonStateConfig : NSObject

- (instancetype)initWithDelegate:(id<SLButtonStateConfigDelegate>)delegate state:(UIControlState)state;

- (SLButtonStateConfig *(^)(NSString *title))title;

- (SLButtonStateConfig *(^)(UIColor *color))titleColor;

- (SLButtonStateConfig *(^)(UIImage *_Nullable image))image;

- (SLButtonStateConfig *(^)(NSString *imageName))imageForName;

- (SLButtonStateConfig *(^)(UIImage *image))backgroundImage;

- (SLButtonStateConfig *(^)(NSString *imageName))backgroundImageForName;

- (SLButtonStateConfig *(^)(MQIconFontStruct iconFont))iconFont;
@end

NS_ASSUME_NONNULL_END
