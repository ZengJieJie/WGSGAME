//
//  SLDirectionFlowLayout.h
//  Hydra
//
//  Created by Sir 姚 on 2023/4/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    SLLayoutAlignment_left,
    SLLayoutAlignment_center,
    SLLayoutAlignment_right,
} SLLayoutAlignment;

@interface SLDirectionFlowLayout : UICollectionViewFlowLayout
@property (nonatomic, assign) SLLayoutAlignment alignment;
@end

NS_ASSUME_NONNULL_END
