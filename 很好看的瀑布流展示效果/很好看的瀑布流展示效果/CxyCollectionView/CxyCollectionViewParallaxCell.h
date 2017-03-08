//
//  CxyCollectionViewParallaxCell.h
//  很好看的瀑布流展示效果
//
//  Created by 华美赛佳 on 2017/3/7.
//  Copyright © 2017年 JonesCxy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CxyCollectionViewParallaxCell : UICollectionViewCell


@property(strong,nonatomic) UIImageView *parallaxImageView;

@property(strong,nonatomic)UIImage *parallaxImage;

@property(nonatomic)CGPoint parallaxImageOffset;

@property(nonatomic)CGFloat maxParallaxOffset;

@property(nonatomic)UIInterfaceOrientation currentOrienration;

@end
