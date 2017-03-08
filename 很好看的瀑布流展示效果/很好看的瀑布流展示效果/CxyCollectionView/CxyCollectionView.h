//
//  CxyCollectionView.h
//  很好看的瀑布流展示效果
//
//  Created by 华美赛佳 on 2017/3/7.
//  Copyright © 2017年 JonesCxy. All rights reserved.
//

#import <UIKit/UIKit.h>



@class CxyCollectionView;
@class CxyCollectionViewParallaxCell;

@protocol CxyCollectionViewDataSource <NSObject>


-(NSInteger)numberOfItemsInBnbCollectionView:(CxyCollectionView *)collectionView;


-(UICollectionViewCell *)bnbCollectionView:(CxyCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;


- (CxyCollectionViewParallaxCell *)bnbCollectionView:(CxyCollectionView *)collectionView parallaxCellForItemAtIndexPath:(NSIndexPath *)indexPath;


@optional

-(UICollectionReusableView *)bnbCollectionView:(CxyCollectionView *)collectionView headerAtIndexPath:(NSIndexPath *)indexPath;


-(UIView *)moreLoaderInBnbCollectionView:(CxyCollectionView *)collectionView;


@end


@protocol CxyCollectionViewDelegate <NSObject>

@optional

-(void)loadMoreInBnbCollectionView:(CxyCollectionView *)collectionView;


@end





@interface CxyCollectionView : UICollectionView <UICollectionViewDataSource>

@property(nonatomic) BOOL loadingMore;

@property(nonatomic)IBInspectable BOOL enableLoadMore;



@end
