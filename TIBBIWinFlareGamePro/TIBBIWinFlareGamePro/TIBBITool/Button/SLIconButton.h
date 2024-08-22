//
//  SLIconButton.h
//  SangoLive
//
//  Created by LONG JUN on 2023/1/6.
//  Copyright © 2023 Sango. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SLIconButton : UIControl

#pragma mark - Public

/// 设置iconFont
/// @param text Unicode编码
/// @param size 大小
/// @param color 颜色
- (void)setIconFontWithText:(NSString *)text size:(CGFloat)size color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
