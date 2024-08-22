//
//  SLCollectionView.h
//  SangoLive
//
//  Created by 胡伟伟 on 2020/9/9.
//  Copyright © 2020 Sango. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SLCollectionView;
@class MJRefreshHeader;
@class MJRefreshFooter;

@protocol mqCollectionViewDataSource <NSObject>
@optional

-(NSInteger)mq_numberOfSectionsInCollectionView:(UICollectionView *)collectionView;

-(NSInteger)mq_collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;

-(__kindof UICollectionViewCell *)mq_collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
-(CGSize)mq_collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
-(CGSize)mq_collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;

-(CGSize)mq_collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
-(UICollectionReusableView *)mq_collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath;
-(UIEdgeInsets)mq_collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
@end

@protocol mqCollectionViewDelegate <NSObject>
@optional
-(void)mq_scrollViewDidScroll:(UIScrollView *)scrollView;
-(void)mq_scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
-(void)mq_scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
-(void)mq_scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView;
- (void)mq_scrollViewWillBeginDragging:(UIScrollView *)scrollView;
@end

typedef void (^indexPathClickAction)(NSIndexPath *indexPath,UICollectionViewCell *mqCell,NSArray *datas);

typedef UICollectionViewCell *_Nullable (^itemSourceAction)(NSIndexPath *indexPath,UICollectionView *collectionView,NSArray *datas);

typedef CGSize (^itemLayoutSizeAction)(NSIndexPath *indexPath,NSArray *datas);
typedef CGSize (^headerLayoutSizeAction)(NSInteger section,NSArray *datas);
typedef CGSize (^footerLayoutSizeAction)(NSInteger section,NSArray *datas);

typedef UICollectionReusableView *_Nullable(^reusableViewBlock)(NSIndexPath *indexPath,UICollectionView *collectionView,NSString *kind,NSArray *datas);

typedef SLCollectionView *_Nullable(^mq_flayout)(UICollectionViewFlowLayout *(^)(void));
typedef SLCollectionView *_Nullable(^mq_minimumLineSpacing)(CGFloat(^)(void));
typedef SLCollectionView *_Nullable(^mq_minimumInteritemSpacing)(CGFloat(^)(void));
typedef SLCollectionView *_Nullable(^mq_scrollDirection)(NSInteger(^)(void));
typedef SLCollectionView *_Nullable(^mq_cellClassNames)(NSArray <NSString *>*(^)(void));
typedef SLCollectionView *_Nullable(^mq_backgroundColor)(UIColor *(^)(void));

typedef SLCollectionView *_Nullable(^mq_rect)(CGRect (^)(void));
typedef SLCollectionView *_Nullable(^mq_edgeInsets)(UIEdgeInsets (^)(void));
typedef SLCollectionView *_Nullable(^mq_scrolEnable)(BOOL (^)(void));
typedef SLCollectionView *_Nullable(^mq_headClassName)(NSString *(^)(void));
typedef SLCollectionView *_Nullable(^mq_footClassName)(NSString *(^)(void));
typedef SLCollectionView *_Nullable(^mq_canMoveItemEnable)(BOOL (^)(void));
typedef SLCollectionView *_Nullable(^mq_showsVerticalScrollIndicatorEnable)(BOOL (^)(void));
typedef SLCollectionView *_Nullable(^mq_showsHorizontalScrollIndicatorEnable)(BOOL (^)(void));
typedef SLCollectionView *_Nullable(^mq_pageEnable)(BOOL (^)(void));
typedef SLCollectionView *_Nullable(^mq_bounceEnable)(BOOL (^)(void));
typedef SLCollectionView *_Nullable(^mq_contentSize)(CGSize (^)(void));
typedef SLCollectionView *_Nullable(^mq_contentOffset)(CGPoint (^)(void));
typedef SLCollectionView *_Nullable(^mq_dataSource)(NSArray *(^)(void));
typedef SLCollectionView *_Nullable(^mq_indexPathClickAction)(void(^)(NSIndexPath *indexPath,UICollectionViewCell *mqCell,NSArray *datas));
typedef SLCollectionView *_Nullable(^mq_itemSourceAction)(UICollectionViewCell *(^)(NSIndexPath *indexPath,UICollectionView *collectionView,NSArray *datas));
typedef SLCollectionView *_Nullable(^mq_itemSizeSource)(CGSize (^)(NSIndexPath *indexPath,NSArray *datas));

typedef SLCollectionView *_Nullable(^mq_headerSizeSource)(CGSize (^)(NSInteger section,NSArray *datas));

typedef SLCollectionView *_Nullable(^mq_footerSizeSource)(CGSize (^)(NSInteger section,NSArray *datas));


typedef SLCollectionView *_Nullable(^collectionViewRefreshHeaderView)(MJRefreshHeader *(^)(void));

typedef SLCollectionView *_Nullable(^collectionViewRefreshFootView)(MJRefreshFooter *(^)(void));


typedef SLCollectionView *_Nullable(^collectionViewResuableViewBlock)(UICollectionReusableView *(^)(NSIndexPath *indexPath,UICollectionView *collectionView,NSString *kind,NSArray *datas));

@interface SLCollectionView : UICollectionView

@property (nonatomic,copy) mq_flayout mqFlayout;

@property (nonatomic,copy) mq_minimumLineSpacing mqMinimumLineSpacing;

@property (nonatomic,copy) mq_minimumInteritemSpacing mqMinimumInteritemSpacing;

@property (nonatomic,copy) mq_scrollDirection mqScrollDirection;

@property (nonatomic,copy) mq_cellClassNames mqClassNames;

@property (nonatomic,copy) mq_backgroundColor mqColor;


@property (nonatomic,copy) mq_rect mqRect;
@property (nonatomic,copy) mq_edgeInsets mqEdageInsets;
@property (nonatomic,copy) mq_scrolEnable mqScrolEnable;
@property (nonatomic,copy) mq_headClassName mqHeadClassName;
@property (nonatomic,copy) mq_footClassName mqFootClassName;
@property (nonatomic,copy) mq_canMoveItemEnable mqCanMoveItemEnable;
@property (nonatomic,copy) mq_showsVerticalScrollIndicatorEnable mqShowsVerticalScrollIndicatorEnable;

@property (nonatomic,copy) mq_showsHorizontalScrollIndicatorEnable mqShowsHorizontalScrollIndicatorEnable;
@property (nonatomic,copy) mq_pageEnable mqPageEnable;

@property (nonatomic,copy) mq_bounceEnable mqBounceEnable;
@property (nonatomic,copy) mq_contentSize mqContentSize;
@property (nonatomic,copy) mq_contentOffset mqContentOffset;
@property (nonatomic,copy) mq_dataSource mqDataSource;

@property (nonatomic,copy) mq_indexPathClickAction mqClickAction;
@property (nonatomic,copy) mq_itemSourceAction mqSourceAction;
@property (nonatomic,copy) mq_itemSizeSource mqItemSizeAction;

@property (nonatomic,copy) mq_headerSizeSource mqheaderSizeActon;

@property (nonatomic,copy) mq_footerSizeSource mqfooterSizeActon;

@property (nonatomic,copy) collectionViewRefreshHeaderView mqCollectionViewRefreshHeader;//headerRefresh


@property (nonatomic,copy) collectionViewRefreshFootView mqCollectionViewRefreshFooter;//footerRefresh


@property (nonatomic,copy) collectionViewResuableViewBlock mqCollectionViewResuableViewBlock;//resuableView

@property (nonatomic,weak) id <mqCollectionViewDataSource> mqCollectionViewDataSource;
@property (nonatomic,weak) id <mqCollectionViewDelegate> mqCollectionViewDelegate;

@end

NS_ASSUME_NONNULL_END
