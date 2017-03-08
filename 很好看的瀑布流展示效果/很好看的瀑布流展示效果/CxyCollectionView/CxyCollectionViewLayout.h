//
//  CxyCollectionViewLayout.h
//  很好看的瀑布流展示效果
//
//  Created by 华美赛佳 on 2017/3/7.
//  Copyright © 2017年 JonesCxy. All rights reserved.
//

#import <UIKit/UIKit.h>

//UIKIT_EXTERN NSString *CxyCollectionElementKindHeader;
//UIKIT_EXTERN NSString *CxyCollectionElementKindMoreLoader;

@interface CxyCollectionViewLayout : UICollectionViewLayout

/**
 *  Grid cell size. Default value is (200, 100).
 */
@property (nonatomic) IBInspectable CGSize gridCellSize;

/**
 *  Parallax cell size. Default value is (400, 200).
 */
@property (nonatomic) IBInspectable CGSize parallaxCellSize;

/**
 *  Header size. Default value is (200, 200).
 *
 *  Set (0, 0) for no header
 */
@property (nonatomic) IBInspectable CGSize headerSize;

/**
 *  Size for more loader section. Default value is (50, 50).
 */
@property (nonatomic) IBInspectable CGSize moreLoaderSize;

/**
 *  Space between grid cells. Default value is (10, 10).
 */
@property (nonatomic) IBInspectable CGSize gridCellSpacing;

/**
 *  Padding for grid. Default value is 20.
 */
@property (nonatomic) IBInspectable CGFloat gridPadding;

/**
 *  Maximum parallax offset. Default value is 50.
 */
@property (nonatomic) IBInspectable CGFloat maxParallaxOffset;

/**
 *  Current orientation, used to layout correctly corresponding to orientation.
 */
@property (nonatomic) UIInterfaceOrientation currentOrientation;




@end
