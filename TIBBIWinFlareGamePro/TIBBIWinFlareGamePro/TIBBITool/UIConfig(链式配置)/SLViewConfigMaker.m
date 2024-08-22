//
//  SLViewConfigMaker.m
//  SangoLive
//
//  Created by YJExpand on 2020/9/21.
//  Copyright © 2020 Sango. All rights reserved.
//

#import "SLViewConfigMaker.h"

@interface SLViewConfigMaker()
@property (nonatomic,weak) UIView *view;
@end

@implementation MQIconFontObjc
@end

@implementation MQLayerShadowObjc
@end

@implementation MQLayerBorderObjC
@end

MQLayerBorder MQLayerBorderMake(CGFloat width,UIColor *color)
{
    MQLayerBorder b = [MQLayerBorderObjC new];
    b.width = width;
    b.color = color;
    return b;
}

MQLayerShadow MQLayerShadowMake(UIColor *color,CGSize offset,CGFloat opacity,CGFloat radius)
{
    MQLayerShadow s = [MQLayerShadowObjc new];
    s.color = color;
    s.offset = offset;
    s.opacity = opacity;
    s.radius = radius;
    return s;
}

MQIconFontStruct MQIconFontStructMake(NSString *text, CGFloat size, UIColor *color)
{
    MQIconFontStruct t = [MQIconFontObjc new];
    t.text = text;
    t.size = size;
    t.color = color;
    return t;
}

@implementation SLViewConfigMaker

- (instancetype)initWithView:(UIView *)view{
    self = [super init];
    if (self) {
        self.view = view;
    }
    return self;
}

- (SLViewConfigMaker *(^)(UIView *))addToSuperView{
    return ^SLViewConfigMaker *(UIView *superView){
        [superView addSubview:self.view];
        return self;
    };
}

- (SLViewConfigMaker *(^)(CGRect))frame{
    return ^SLViewConfigMaker *(CGRect rect){
        [self.view setFrame:rect];
        return self;
    };
}
- (SLViewConfigMaker *(^)(UIColor *))backgroundColor{
    return ^SLViewConfigMaker *(UIColor *color){
        [self.view setBackgroundColor:color];
        return self;
    };
}

- (SLViewConfigMaker *(^)(CGFloat))cornerRadius{
    return ^SLViewConfigMaker *(CGFloat radius){
        self.view.layer.cornerRadius = radius;
        return self;
    };
}

- (SLViewConfigMaker *(^)(BOOL))masksToBounds{
    return ^SLViewConfigMaker *(BOOL masks){
        self.view.layer.masksToBounds = masks;
        return self;
    };
}

- (SLViewConfigMaker *(^)(BOOL))clipsToBounds{
    return ^SLViewConfigMaker *(BOOL clips){
        self.view.clipsToBounds = clips;
        return self;
    };
}
- (SLViewConfigMaker *(^)(MQLayerBorder))border{
    return ^SLViewConfigMaker *(MQLayerBorder border){
        self.view.layer.borderWidth = border.width;
        self.view.layer.borderColor = border.color.CGColor;
        return self;
    };
}
- (SLViewConfigMaker *(^)(MQLayerShadow))shadow{
    return ^SLViewConfigMaker *(MQLayerShadow shadow){
        self.view.layer.shadowColor = shadow.color.CGColor;
        self.view.layer.shadowOffset = shadow.offset;
        self.view.layer.shadowOpacity = shadow.opacity;
        self.view.layer.shadowRadius = shadow.radius;
        return self;
    };
}
- (SLViewConfigMaker *(^)(BOOL))userInteractionEnabled{
    return ^SLViewConfigMaker *(BOOL enabled){
        self.view.userInteractionEnabled = enabled;
        return self;
    };
}

- (SLViewConfigMaker *(^)(NSInteger))tag{
    return ^SLViewConfigMaker *(NSInteger tag){
        self.view.tag = tag;
        return self;
    };
}

- (SLViewConfigMaker *(^)(BOOL))hidden{
    return ^SLViewConfigMaker *(BOOL hidden){
        self.view.hidden = hidden;
        return self;
    };
}

- (SLViewConfigMaker *(^)(CGFloat))alpha{
    return ^SLViewConfigMaker *(CGFloat alpha){
        self.view.alpha = alpha;
        return self;
    };
}

/// 点击手势
- (SLViewConfigMaker *(^)(id target,SEL select))tapGesture{
    return ^SLViewConfigMaker *(id target,SEL select){
        self.view.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:select];
        [self.view addGestureRecognizer:tap];
        return self;
    };
}

/// 长按手势
- (SLViewConfigMaker *(^)(id target,SEL select))longPressGesture{
    return ^SLViewConfigMaker *(id target,SEL select){
        self.view.userInteractionEnabled = YES;
        UILongPressGestureRecognizer *tap = [[UILongPressGestureRecognizer alloc] initWithTarget:target action:select];
        [self.view addGestureRecognizer:tap];
        return self;
    };
}
@end
