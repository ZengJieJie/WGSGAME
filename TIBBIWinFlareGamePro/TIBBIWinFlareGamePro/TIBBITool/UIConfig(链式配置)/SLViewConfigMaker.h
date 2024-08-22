//
//  SLViewConfigMaker.h
//  SangoLive
//
//  Created by YJExpand on 2020/9/21.
//  Copyright © 2020 Sango. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface MQIconFontObjc : NSObject
@property (nonatomic) CGFloat size;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIColor *color;
@end

@interface MQLayerShadowObjc : NSObject
@property (nonatomic) CGSize offset;
@property (nonatomic) CGFloat opacity;
@property (nonatomic) CGFloat radius;
@property (nonatomic, strong) UIColor *color;
@end

@interface MQLayerBorderObjC : NSObject
@property (nonatomic, strong) UIColor *color;
@property (nonatomic) CGFloat width;
@end

typedef MQLayerBorderObjC* MQLayerBorder;
typedef MQIconFontObjc* MQIconFontStruct;
typedef MQLayerShadowObjc* MQLayerShadow;

extern MQLayerBorder MQLayerBorderMake(CGFloat width,UIColor *color);

extern MQLayerShadow MQLayerShadowMake(UIColor *color,CGSize offset,CGFloat opacity,CGFloat radius);

extern MQIconFontStruct MQIconFontStructMake(NSString *text, CGFloat size, UIColor *color);

@interface SLViewConfigMaker : NSObject

@property (nonatomic,weak,readonly) UIView *view;

- (instancetype)initWithView:(UIView *)view;

/// 添加到superView中
- (SLViewConfigMaker *(^)(UIView *superView))addToSuperView;
/// frame
- (SLViewConfigMaker *(^)(CGRect rect))frame;
/// 背景颜色
- (SLViewConfigMaker *(^)(UIColor *color))backgroundColor;
/// 圆角
- (SLViewConfigMaker *(^)(CGFloat radius))cornerRadius;
/// 超出隐藏
- (SLViewConfigMaker *(^)(BOOL masks))masksToBounds;
/// 超出隐藏
- (SLViewConfigMaker *(^)(BOOL clips))clipsToBounds;
/// 边框
- (SLViewConfigMaker *(^)(MQLayerBorder))border;
/// 阴影
- (SLViewConfigMaker *(^)(MQLayerShadow))shadow;
/// 触摸开关
- (SLViewConfigMaker *(^)(BOOL enabled))userInteractionEnabled;
/// tag
- (SLViewConfigMaker *(^)(NSInteger tag))tag;
/// 隐藏
- (SLViewConfigMaker *(^)(BOOL hidden))hidden;
/// 透明度
- (SLViewConfigMaker *(^)(CGFloat alpha))alpha;
/// 点击手势
- (SLViewConfigMaker *(^)(id target,SEL select))tapGesture;
/// 长按手势
- (SLViewConfigMaker *(^)(id target,SEL select))longPressGesture;
@end

NS_ASSUME_NONNULL_END
