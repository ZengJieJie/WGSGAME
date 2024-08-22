//
//  SLButtonStateConfig.m
//  SangoLive
//
//  Created by YJExpand on 2020/9/22.
//  Copyright © 2020 Sango. All rights reserved.
//

#import "SLButtonStateConfig.h"
#import "SLViewConfigMaker.h"

@interface SLButtonStateConfig()

@property (nonatomic,weak) id<SLButtonStateConfigDelegate> delegate;
@property (nonatomic,assign) UIControlState currentState;
@end

@implementation SLButtonStateConfig

- (instancetype)initWithDelegate:(id<SLButtonStateConfigDelegate>)delegate state:(UIControlState)state{
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.currentState = state;
    }
    return self;
}
- (SLButtonStateConfig *(^)(NSString *))title{
    return ^SLButtonStateConfig *(NSString *title){
        [[self.delegate currentView] setTitle:title forState:self.currentState];
        return self;
    };
}

- (SLButtonStateConfig *(^)(UIColor *))titleColor{
    return ^SLButtonStateConfig *(UIColor *color){
        [[self.delegate currentView] setTitleColor:color forState:self.currentState];
        return self;
    };
}

- (SLButtonStateConfig *(^)(UIImage *_Nullable))image{
    return ^SLButtonStateConfig *(UIImage *image){
        [[self.delegate currentView] setImage:image forState:self.currentState];
        return self;
    };
}

- (SLButtonStateConfig *(^)(NSString *))imageForName{
    return ^SLButtonStateConfig *(NSString *imageName){
        return self.image([UIImage imageNamed:imageName]);
    };
}

- (SLButtonStateConfig *(^)(UIImage *))backgroundImage{
    return ^SLButtonStateConfig *(UIImage *image){
        [[self.delegate currentView] setBackgroundImage:image forState:self.currentState];
        return self;
    };
}

- (SLButtonStateConfig *(^)(NSString *))backgroundImageForName{
    return ^SLButtonStateConfig *(NSString *imageName){
        return self.backgroundImage([UIImage imageNamed:imageName]);
    };
}


@end
