//
//  UIView+BlurEffect.h
//  Hydra
//
//  Created by LONG JUN on 2023/3/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class SLBlurEffectView;

@interface UIView (BlurEffect)

/// 白色毛玻璃
- (SLBlurEffectView *)addLightBlurEffectView;
/// 黑色毛玻璃
- (SLBlurEffectView *)addDarkBlurEffectView;

@end

NS_ASSUME_NONNULL_END
