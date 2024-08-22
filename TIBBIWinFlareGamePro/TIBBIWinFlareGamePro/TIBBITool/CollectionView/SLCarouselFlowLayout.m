//
//  SLCarouselFlowLayout.m
//  SangoLive
//
//  Created by YJExpand on 2021/7/23.
//  Copyright © 2021 Sango. All rights reserved.
//

#import "SLCarouselFlowLayout.h"

@interface SLCarouselFlowLayout()
/**
 默认轮播图宽度
 */
@property (nonatomic, assign) CGFloat                   defaultItemWidth;
@property (nonatomic, assign) CGFloat                   factItemSpace;
@end

@implementation SLCarouselFlowLayout
- (instancetype)initWithStyle:(MQCarouselStyle)style {
    if(self = [super init]) {
        self.style = style;
        [self initial];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

- (void)initial {
    self.itemSpace_H = 1;
    self.itemSpace_V = 1;
    self.minScale = 0.8;
    self.maxScale = 1.2;
}

- (void)prepareLayout {
    switch (self.style) {
        case MQCarouselStyle_Normal:
            {
                CGFloat width = CGRectGetWidth(self.collectionView.frame);
                CGFloat height = CGRectGetHeight(self.collectionView.frame);
                self.itemWidth = width;
                self.itemSize = CGSizeMake(width, height);
                self.minimumLineSpacing = self.itemSpace_H;
                self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            }
            break;
        case MQCarouselStyle_H_1: {
            CGFloat width = self.itemWidth == 0 ? self.defaultItemWidth : self.itemWidth;
            self.itemWidth = width;
            CGFloat height = CGRectGetHeight(self.collectionView.frame);
            self.itemSize = CGSizeMake(width, height);
            self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            self.minimumLineSpacing = self.itemSpace_H;
            break;
        }
        case MQCarouselStyle_H_2:
        case MQCarouselStyle_H_3: {
            CGFloat width = self.itemWidth == 0 ? self.defaultItemWidth : self.itemWidth;
            self.itemWidth = width;
            CGFloat height = CGRectGetHeight(self.collectionView.frame);
            self.itemSize = CGSizeMake(width, self.style == MQCarouselStyle_H_3 ? height / self.maxScale : height);
            self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            self.factItemSpace = 0;
            if(width * (1 - self.minScale) * 0.5 < self.itemSpace_H) {
                self.factItemSpace = self.itemSpace_H - width * (1 - self.minScale) * 0.5;
            }
            self.minimumLineSpacing = self.factItemSpace;
        }
            break;
        
        default:
            break;
    }
    
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    if(self.style != MQCarouselStyle_Normal &&
       self.style != MQCarouselStyle_Unknow &&
       self.style != MQCarouselStyle_H_1) {
        NSArray<UICollectionViewLayoutAttributes *> *arr = [[NSArray alloc] initWithArray:[super layoutAttributesForElementsInRect:rect] copyItems:YES];
        CGFloat centerX = self.collectionView.contentOffset.x + CGRectGetWidth(self.collectionView.frame) * 0.5;
        CGFloat width = self.itemWidth;
        __block CGFloat maxScale = 0;
        __block UICollectionViewLayoutAttributes *attri = nil;
        [arr enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CGFloat space = ABS(obj.center.x - centerX);
            if(space >= 0) {
                CGFloat scale = 1;
                if (self.style == MQCarouselStyle_H_2) {
                    scale = (self.minScale - 1) / (self.itemWidth + self.factItemSpace) * space + 1;
                }else {
                    scale = -((self.maxScale - 1) / width) * space + self.maxScale;
                }
                obj.transform = CGAffineTransformMakeScale(scale, scale);
                if(maxScale < scale) {
                    maxScale = scale;
                    attri = obj;
                }
            }
            obj.zIndex = 0;
        }];
        if (attri) {
            attri.zIndex = 1;
        }
        return arr;
    }else {
        return [super layoutAttributesForElementsInRect:rect];
    }
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
//    CGRect rect;
//    _adjustIndexPath = nil;
//    rect.origin.x = proposedContentOffset.x;
//    rect.origin.y = 0;
//    rect.size.width = CGRectGetWidth(self.collectionView.frame);
//    rect.size.height = CGRectGetHeight(self.collectionView.frame);
//
//    CGFloat centerX = proposedContentOffset.x + CGRectGetWidth(self.collectionView.frame) * 0.5;
//    NSArray <UICollectionViewLayoutAttributes *>  *tempArr = [super layoutAttributesForElementsInRect:rect];
//    __block CGFloat minSpace = MAXFLOAT;
//    __block UICollectionViewLayoutAttributes *attributes = nil;
//    [tempArr enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        obj.zIndex = 0;
//        if(ABS(minSpace) > ABS(obj.center.x - centerX)) {
//            minSpace = obj.center.x - centerX;
//            attributes = obj;
//        }
//    }];
//    attributes.zIndex = 1;
//    _currentAttri = attributes;
//    if(velocity.x == 0) {
//        proposedContentOffset.x += minSpace;
//        _adjustIndexPath = nil;
//    }else if(attributes) {
//        if(ABS(minSpace) >= attributes.size.width * 0.15) {
//            NSInteger der = attributes.indexPath.row;
//            if(velocity.x > 0) {
//                der = (minSpace < 0 && velocity.x > 0) ? 1 : 0;
//            }else {
//                der = (minSpace > 0 && velocity.x < 0) ? -1 : 0;
//            }
//            _adjustIndexPath = [NSIndexPath indexPathForRow:attributes.indexPath.row + der inSection:attributes.indexPath.section];
//        }else {
//            _adjustIndexPath = attributes.indexPath;
//        }
//    }
    return proposedContentOffset;
}
#pragma mark - Property
- (CGFloat)defaultItemWidth {
    switch (self.style) {
        case MQCarouselStyle_Unknow:
        case MQCarouselStyle_Normal:
            return self.collectionView.frame.size.width;
            break;
        case MQCarouselStyle_H_1:
        case MQCarouselStyle_H_2:
        case MQCarouselStyle_H_3:
            return self.collectionView.frame.size.width * 0.75;
            break;
        default:
            break;
    }
}

- (void)setMaxScale:(CGFloat)maxScale {
    _maxScale = maxScale;
    if(maxScale < 1) {
        _maxScale = 1;
    }
}

- (void)setMinScale:(CGFloat)minScale {
    _minScale = minScale;
    if(minScale < 0) {
        _minScale = 0.1;
    }
    if (minScale >= 1) {
        _minScale = 1;
    }
}
@end
