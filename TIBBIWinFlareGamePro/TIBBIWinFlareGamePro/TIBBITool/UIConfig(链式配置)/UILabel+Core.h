//
//  UILabel+Core.h
//  SangoLive
//
//  Created by YJExpand on 2020/9/21.
//  Copyright © 2020 Sango. All rights reserved.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Core)

#pragma mark- 链式配置属性


/// 设置iconFont
/// @param text Unicode编码
/// @param size 大小
/// @param color 颜色
- (void)mq_setIconFontWithText:(NSString *)text size:(CGFloat)size color:(UIColor *)color;

/// 设置iconFont 禁止镜像反转
/// @param text 图标
/// @param size 大小
/// @param color 颜色
- (void)mq_setIconFontOriginWithText:(NSString *)text size:(CGFloat)size color:(UIColor *)color;


/// 绘制字体图标
/// @param itemIdentifier 字体图标标识
/// @param fontSize 字体大小
/// @param textColor 字体颜色
-(void)textforIdentifier:(NSString *)itemIdentifier
                  size:(CGFloat)fontSize
                   color:(UIColor *)textColor;

@end

NS_ASSUME_NONNULL_END
