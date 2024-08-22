//
//  SLCollectionView.m
//  SangoLive
//
//  Created by 胡伟伟 on 2020/9/9.
//  Copyright © 2020 Sango. All rights reserved.
//

#import "SLCollectionView.h"

@interface SLCollectionView ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
@property (nonatomic,assign) BOOL moveItemEnable;
@property (nonatomic,strong) NSMutableArray *datas;

@property (nonatomic,copy) indexPathClickAction itemClickAction;
@property (nonatomic,strong) NSArray <NSString *>*classNameIdetifiers;
@property (nonatomic,copy) itemSourceAction sourceAction;

@property (nonatomic,copy) itemLayoutSizeAction itemSizeSourcAction;
@property (nonatomic,copy) headerLayoutSizeAction headerSizeAction;
@property (nonatomic,copy) reusableViewBlock reusableAction;
@property (nonatomic,copy) footerLayoutSizeAction footerSizeAction;


@end

@implementation SLCollectionView

-(NSArray <NSString *>*)classNameIdetifiers{
    if (!_classNameIdetifiers) {
        _classNameIdetifiers = ({
            NSArray <NSString *>* classNameIdentifiers = [NSArray array];
            classNameIdentifiers;
        });
    }
    return _datas;
}
-(NSMutableArray *)datas{
    if (!_datas) {
        _datas = ({
            NSMutableArray *datas = [NSMutableArray array];
            datas;
        });
    }
    return _datas;
}

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.delegate = self;
        self.dataSource = self;
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        UILongPressGestureRecognizer *longpress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
        longpress.minimumPressDuration = 0.5;
        [self addGestureRecognizer:longpress];
    }
    return self;
}
-(mq_flayout)mqFlayout{
    return ^SLCollectionView *(UICollectionViewFlowLayout *(^flayout)(void)){
        if (!self.flowLayout) {
            self.flowLayout = flayout();
            [self setCollectionViewLayout:flayout()];
        }
        return self;
    };
}
-(mq_minimumLineSpacing)mqMinimumLineSpacing{
    return ^SLCollectionView *(CGFloat (^minimumLineSpacing)(void)){
        if (self.flowLayout) {
            self.flowLayout.minimumLineSpacing = minimumLineSpacing();
            [self setCollectionViewLayout:self.flowLayout];
            [self reloadData];
        }else{
            UICollectionViewFlowLayout *flayout = [[UICollectionViewFlowLayout alloc] init];
            flayout.minimumLineSpacing = minimumLineSpacing();
            self.flowLayout = flayout;
            [self setCollectionViewLayout:self.flowLayout];
            [self reloadData];
        }
        return self;
    };
}
-(mq_minimumInteritemSpacing)mqMinimumInteritemSpacing{
    return ^SLCollectionView *(CGFloat (^minimumInteritemSpacing)(void)){
        if (self.flowLayout) {
            self.flowLayout.minimumInteritemSpacing = minimumInteritemSpacing();
            [self setCollectionViewLayout:self.flowLayout];
            [self reloadData];
        }else{
            UICollectionViewFlowLayout *flayout = [[UICollectionViewFlowLayout alloc] init];
            flayout.minimumInteritemSpacing = minimumInteritemSpacing();
            self.flowLayout = flayout;
            [self setCollectionViewLayout:self.flowLayout];
            [self reloadData];
        }
        return self;
    };
}
-(mq_scrollDirection)mqScrollDirection{
    return ^SLCollectionView *(NSInteger (^scrollDirection)(void)){
        if (self.flowLayout) {
//            self.flowLayout.scrollDirection = scrollDirection();
            [self setCollectionViewLayout:self.flowLayout];
            [self reloadData];
        }else{
            UICollectionViewFlowLayout *flayout = [[UICollectionViewFlowLayout alloc] init];
//            flayout.scrollDirection = scrollDirection();
            self.flowLayout = flayout;
            [self setCollectionViewLayout:self.flowLayout];
            [self reloadData];
        }
        return self;
    };
}
-(mq_cellClassNames)mqClassNames{
    return ^SLCollectionView *(NSArray<NSString *>* (^mq_classs)(void)){
        NSArray <NSString *>*classNames = mq_classs();
        [classNames enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            Class cellClass = NSClassFromString(obj);
            [self registerClass:cellClass forCellWithReuseIdentifier:obj];
        }];
        return self;
    };
}

-(mq_backgroundColor)mqColor{
    return ^SLCollectionView *(UIColor * (^mq_color)(void)){
        self.backgroundColor = mq_color();
        return self;
    };
}
-(mq_rect)mqRect{
    return   ^SLCollectionView *(CGRect  (^mqRect)(void)){
        [self setFrame:mqRect()];
        [self layoutIfNeeded];
        return self;
    };
}

-(mq_edgeInsets)mqEdageInsets{
    return  ^SLCollectionView *(UIEdgeInsets  (^edgeInsets)(void)){
        [self setContentInset:edgeInsets()];
        return self;
    };
}
-(mq_scrolEnable)mqScrolEnable{
    return   ^SLCollectionView *(BOOL  (^mqScrolEnable)(void)){
        [self setScrollEnabled:mqScrolEnable()];
        return self;
    };
}
-(mq_headClassName)mqHeadClassName{
    return   ^SLCollectionView *(NSString * (^mqHeadClassName)(void)){
        [self registerClass:NSClassFromString(mqHeadClassName()) forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:mqHeadClassName()];
        return self;
    };
}

-(mq_footClassName)mqFootClassName{
    return   ^SLCollectionView *(NSString * (^mqFootClassName)(void)){
        [self registerClass:NSClassFromString(mqFootClassName()) forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:mqFootClassName()];
        return self;
    };;
}
-(mq_canMoveItemEnable)mqCanMoveItemEnable{
    return   ^SLCollectionView *(BOOL  (^mqCanMoveItemEnable)(void)){
        [self setMoveItemEnable:mqCanMoveItemEnable()];
//        [self reloadData];
        return self;
    };;
}
-(mq_showsVerticalScrollIndicatorEnable)mqShowsVerticalScrollIndicatorEnable{
    return   ^SLCollectionView *(BOOL  (^mqShowsVerticalScrollIndicatorEnable)(void)){
        [self setShowsVerticalScrollIndicator:mqShowsVerticalScrollIndicatorEnable()];
        return self;
    };;
}
-(mq_showsHorizontalScrollIndicatorEnable)mqShowsHorizontalScrollIndicatorEnable{
    return   ^SLCollectionView *(BOOL  (^mqShowsHorizontalScrollIndicatorEnable)(void)){
        [self setShowsHorizontalScrollIndicator:mqShowsHorizontalScrollIndicatorEnable()];
        return self;
    };;
}
-(mq_pageEnable)mqPageEnable{
    return   ^SLCollectionView *(BOOL  (^mqPageEnable)(void)){
        [self setPagingEnabled:mqPageEnable()];
        return self;
    };;
}
-(mq_bounceEnable)mqBounceEnable{
    return   ^SLCollectionView *(BOOL  (^mqBounceEnable)(void)){
        [self setBounces:mqBounceEnable()];
        return self;
    };;
}
-(mq_contentSize)mqContentSize{
    return   ^SLCollectionView *(CGSize  (^mqContentSize)(void)){
        [self setContentSize:mqContentSize()];
        return self;
    };;
}
-(mq_contentOffset)mqContentOffset{
    return   ^SLCollectionView *(CGPoint  (^mqContentOffset)(void)){
        [self setContentOffset:mqContentOffset()];
        return self;
    };;
}
//-(mq_dataSource)mqDataSource{
//    return   ^SLCollectionView *(NSArray * (^mqDataSource)(void)){
//        
//        __weak typeof(mqDataSource())weakDataSource = mqDataSource();
//        if(!weakDataSource){
//
//            self.datas = mqDataSource().mutableCopy;
//            return self;
//        }
//        self.datas = weakDataSource.mutableCopy;
//        return self;
//    };;
//}
-(mq_indexPathClickAction)mqClickAction{
    return   ^SLCollectionView *(void (^mqClickAction)(NSIndexPath *indexPath,UICollectionViewCell *mqCell,NSArray *datas)){
        self.itemClickAction = mqClickAction;
        return self;
    };;
}

-(mq_itemSourceAction)mqSourceAction{
    return   ^SLCollectionView *(UICollectionViewCell * (^sourceAction)(NSIndexPath *indexPath,UICollectionView *collectionView,NSArray *datas)){
        self.sourceAction = sourceAction;
        return self;
    };;
}
-(mq_itemSizeSource)mqItemSizeAction{
    return   ^SLCollectionView *(CGSize (^itemSizeAction)(NSIndexPath *indexPath,NSArray *datas)){
        self.itemSizeSourcAction = itemSizeAction;
        return self;
    };;
}
-(mq_headerSizeSource)mqheaderSizeActon{
    return   ^SLCollectionView *(CGSize (^headerSizeSource)(NSInteger section,NSArray *datas)){
        self.headerSizeAction = headerSizeSource;
        return self;
    };;
}

-(mq_footerSizeSource)mqfooterSizeActon{
    return   ^SLCollectionView *(CGSize (^footerSizeSource)(NSInteger section,NSArray *datas)){
        self.footerSizeAction = footerSizeSource;
        return self;
    };;
}

//-(collectionViewRefreshHeaderView)mqCollectionViewRefreshHeader{
//    return   ^SLCollectionView *(MJRefreshHeader *(^refreshHeader)(void)){
//        self.mj_header = refreshHeader();
//        return self;
//    };;
//}
//
//-(collectionViewRefreshFootView)mqCollectionViewRefreshFooter{
//    return   ^SLCollectionView *(MJRefreshFooter *(^refreshFooter)(void)){
//        self.mj_footer = refreshFooter();
//        return self;
//    };
//}


-(collectionViewResuableViewBlock)mqCollectionViewResuableViewBlock{
    return   ^SLCollectionView *(UICollectionReusableView *(^resuableViewBlock)(NSIndexPath *indexPath,UICollectionView *collectionView,NSString *kind,NSArray *datas)){
        self.reusableAction  = resuableViewBlock;
        return self;
    };
}




-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (self.mqCollectionViewDataSource &&[self.mqCollectionViewDataSource respondsToSelector:@selector(mq_numberOfSectionsInCollectionView:)]) {
        return [self.mqCollectionViewDataSource mq_numberOfSectionsInCollectionView:collectionView];
    }
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (self.mqCollectionViewDataSource &&[self.mqCollectionViewDataSource respondsToSelector:@selector(mq_collectionView:numberOfItemsInSection:)]) {
        return [self.mqCollectionViewDataSource mq_collectionView:collectionView numberOfItemsInSection:section];
    }
    return self.datas.count;
}
-(__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (!self.sourceAction &&!self.mqCollectionViewDataSource &&![self.mqCollectionViewDataSource respondsToSelector:@selector(mq_collectionView:cellForItemAtIndexPath:)]) NSAssert(nil,@"UICollectionViewCell数据源必须设置");
    if (self.mqCollectionViewDataSource &&[self.mqCollectionViewDataSource respondsToSelector:@selector(mq_collectionView:cellForItemAtIndexPath:)]) {
        return [self.mqCollectionViewDataSource mq_collectionView:collectionView cellForItemAtIndexPath:indexPath];
    }
//    NSInteger sectionNumber = 0;
//    NSInteger rowNumber = 0;
//    if (self.mqCollectionViewDataSource &&[self.mqCollectionViewDataSource respondsToSelector:@selector(mq_numberOfSectionsInCollectionView:)]) {
//        sectionNumber = indexPath.section;
//    }
//    if (self.mqCollectionViewDataSource &&[self.mqCollectionViewDataSource respondsToSelector:@selector(mq_collectionView:numberOfItemsInSection:)]) {
//        rowNumber = indexPath.row;
//    }
    
    return self.sourceAction(indexPath,collectionView,self.datas);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger sectionNumber = 0;
    NSInteger rowNumber = 0;
    if (self.mqCollectionViewDataSource &&[self.mqCollectionViewDataSource respondsToSelector:@selector(mq_numberOfSectionsInCollectionView:)]) {
        sectionNumber = indexPath.section;
    }
    if (self.mqCollectionViewDataSource &&[self.mqCollectionViewDataSource respondsToSelector:@selector(mq_collectionView:numberOfItemsInSection:)]) {
        rowNumber = indexPath.row;
    }
    if (self.itemClickAction) {
        self.itemClickAction(indexPath, [collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:rowNumber inSection:sectionNumber]],self.datas);
    }
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (!self.itemSizeSourcAction &&!self.mqCollectionViewDataSource &&![self.mqCollectionViewDataSource respondsToSelector:@selector(mq_collectionView:layout:sizeForItemAtIndexPath:)]) NSAssert(nil, @"item大小必须设置");
    if (self.mqCollectionViewDataSource &&[self.mqCollectionViewDataSource respondsToSelector:@selector(mq_collectionView:layout:sizeForItemAtIndexPath:)]) {
        return [self.mqCollectionViewDataSource mq_collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:indexPath];
    }
    return self.itemSizeSourcAction(indexPath,self.datas);
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (self.mqCollectionViewDataSource &&[self.mqCollectionViewDataSource respondsToSelector:@selector(mq_collectionView:layout:referenceSizeForHeaderInSection:)]) {
        return [self.mqCollectionViewDataSource mq_collectionView:collectionView layout:collectionViewLayout referenceSizeForHeaderInSection:section];
    }
    return  self.headerSizeAction ?self.headerSizeAction(section,self.datas):CGSizeZero;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (self.mqCollectionViewDataSource &&[self.mqCollectionViewDataSource respondsToSelector:@selector(mq_collectionView:layout:referenceSizeForFooterInSection:)]) {
        return [self.mqCollectionViewDataSource mq_collectionView:collectionView layout:collectionViewLayout referenceSizeForFooterInSection:section];
    }
    return self.footerSizeAction ? self.footerSizeAction(section,self.datas):CGSizeZero;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (self.mqCollectionViewDataSource &&[self.mqCollectionViewDataSource respondsToSelector:@selector(mq_collectionView:viewForSupplementaryElementOfKind:atIndexPath:)]) {
        return [self.mqCollectionViewDataSource mq_collectionView:collectionView viewForSupplementaryElementOfKind:kind atIndexPath:indexPath];
    }
    return self.reusableAction ? self.reusableAction(indexPath,collectionView,kind,self.datas):nil;
}

-(void)longPress:(UILongPressGestureRecognizer*)recognizer
{
    switch (recognizer.state) {
        case UIGestureRecognizerStateBegan: {
            [self handleEditingMoveWhenGestureBegan:recognizer];
            break;
        }
        case UIGestureRecognizerStateChanged: {
            [self handleEditingMoveWhenGestureChanged:recognizer];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            [self handleEditingMoveWhenGestureEnded:recognizer];
            break;
        }
        default: {
            [self handleEditingMoveWhenGestureCanceledOrFailed:recognizer];
            break;
        }
    }
}
- (void)handleEditingMoveWhenGestureBegan:(UILongPressGestureRecognizer *)recognizer{
    
    CGPoint pressPoint = [recognizer locationInView:self];
    NSIndexPath* selectIndexPath = [self indexPathForItemAtPoint:pressPoint];
    [self beginInteractiveMovementForItemAtIndexPath:selectIndexPath];
    
}
- (void)handleEditingMoveWhenGestureChanged:(UILongPressGestureRecognizer *)recognizer{
    
    CGPoint pressPoint = [recognizer locationInView:self];
    [self updateInteractiveMovementTargetPosition:pressPoint];
    
}
- (void)handleEditingMoveWhenGestureEnded:(UILongPressGestureRecognizer *)recognizer{
    
    [self endInteractiveMovement];
    
}
- (void)handleEditingMoveWhenGestureCanceledOrFailed:(UILongPressGestureRecognizer *)recognizer{
    
    CGPoint __unused pressPoint = [recognizer locationInView:self];
    [self cancelInteractiveMovement];
    
}
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.moveItemEnable;
}
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath*)destinationIndexPath
{
    if (sourceIndexPath.item > destinationIndexPath.item )
    {
        id obj = [self.datas objectAtIndex:sourceIndexPath.item];
        [self.datas removeObjectAtIndex:sourceIndexPath.item];
        
        [self.datas insertObject:obj atIndex:destinationIndexPath.item];
    }
    else
    {
        [self.datas exchangeObjectAtIndex:sourceIndexPath.item withObjectAtIndex:destinationIndexPath.item];
    }
    [self reloadItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:sourceIndexPath.item inSection:0],[NSIndexPath indexPathForItem:destinationIndexPath.item inSection:0]]];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.mqCollectionViewDelegate &&[self.mqCollectionViewDelegate respondsToSelector:@selector(mq_scrollViewDidScroll:)]) {
        [self.mqCollectionViewDelegate mq_scrollViewDidScroll:scrollView];
    }
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (self.mqCollectionViewDelegate &&[self.mqCollectionViewDelegate respondsToSelector:@selector(mq_scrollViewDidEndDragging:willDecelerate:)]) {
         [self.mqCollectionViewDelegate mq_scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
     }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (self.mqCollectionViewDelegate &&[self.mqCollectionViewDelegate respondsToSelector:@selector(mq_scrollViewDidEndDecelerating:)]) {
         [self.mqCollectionViewDelegate mq_scrollViewDidEndDecelerating:scrollView];
     }
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    if (self.mqCollectionViewDelegate &&[self.mqCollectionViewDelegate respondsToSelector:@selector(mq_scrollViewDidEndScrollingAnimation:)]) {
         [self.mqCollectionViewDelegate mq_scrollViewDidEndScrollingAnimation:scrollView];
     }
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (self.mqCollectionViewDelegate &&[self.mqCollectionViewDelegate respondsToSelector:@selector(mq_scrollViewWillBeginDragging:)]) {
        [self.mqCollectionViewDelegate mq_scrollViewWillBeginDragging:scrollView];
    }
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (self.mqCollectionViewDataSource &&[self.mqCollectionViewDataSource respondsToSelector:@selector(mq_collectionView:layout:insetForSectionAtIndex:)]) {
        return [self.mqCollectionViewDataSource mq_collectionView:collectionView layout:collectionViewLayout insetForSectionAtIndex:section];
    }
    return UIEdgeInsetsZero;
}



@end
