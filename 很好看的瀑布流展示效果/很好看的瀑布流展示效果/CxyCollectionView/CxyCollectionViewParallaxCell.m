//
//  CxyCollectionViewParallaxCell.m
//  很好看的瀑布流展示效果
//
//  Created by 华美赛佳 on 2017/3/7.
//  Copyright © 2017年 JonesCxy. All rights reserved.
//

#import "CxyCollectionViewParallaxCell.h"

@implementation CxyCollectionViewParallaxCell

{


    NSLayoutConstraint *_parallaxImageViewWidthConstraint;
    NSLayoutConstraint *_parallaxImageViewHeightConstraint;
    NSLayoutConstraint *_parallaxImageViewCenterXConstraint;
    NSLayoutConstraint *_parallaxImageViewCenterYConstraint;

}



-(instancetype)initWithCoder:(NSCoder *)aDecoder{

    if (self = [super initWithCoder:aDecoder]) {
        
        [self setUp];
    }
    return self;
}



-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self setUp];
    }
    return self;
}



-(void)setUp{

    
    _currentOrienration = UIInterfaceOrientationPortrait; // 屏幕旋转正常
    _parallaxImageView = [[UIImageView alloc]init];
    
    _parallaxImageView.contentMode = UIViewContentModeScaleToFill;
    
    _parallaxImageView.clipsToBounds = true;
    _parallaxImageView.image = self.parallaxImage;
    [self.contentView  insertSubview:_parallaxImageView atIndex:0];
    
    _parallaxImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _parallaxImageViewWidthConstraint = [NSLayoutConstraint constraintWithItem:_parallaxImageView attribute:(NSLayoutAttributeWidth) relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:(NSLayoutAttributeWidth) multiplier:1 constant:0];
    _parallaxImageViewHeightConstraint = [NSLayoutConstraint constraintWithItem:_parallaxImageView attribute:(NSLayoutAttributeHeight) relatedBy:(NSLayoutRelationEqual) toItem:self.contentView attribute:(NSLayoutAttributeHeight) multiplier:1 constant:0];
    _parallaxImageViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:_parallaxImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    _parallaxImageViewCenterYConstraint = [NSLayoutConstraint constraintWithItem:_parallaxImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    

    [self.contentView addConstraint:_parallaxImageViewWidthConstraint];
    [self.contentView addConstraint:_parallaxImageViewHeightConstraint];
    [self.contentView addConstraint:_parallaxImageViewCenterXConstraint];
    [self.contentView addConstraint:_parallaxImageViewCenterYConstraint];
    


}



-(void)setParallaxImage:(UIImage *)parallaxImage{

    _parallaxImage = parallaxImage;
    
    _parallaxImageView.image = _parallaxImage;
}


-(void)setParallaxImageOffset:(CGPoint)parallaxImageOffset{


    _parallaxImageViewCenterXConstraint.constant = parallaxImageOffset.x;
    _parallaxImageViewCenterYConstraint.constant = parallaxImageOffset.y;
}


-(void)setMaxParallaxOffset:(CGFloat)maxParallaxOffset{

    _maxParallaxOffset = maxParallaxOffset;
    if (UIInterfaceOrientationIsPortrait(self.currentOrienration)) {
        
        _parallaxImageViewWidthConstraint.constant = 0;
        _parallaxImageViewHeightConstraint.constant = 2 * maxParallaxOffset;
    }else{
    
        _parallaxImageViewWidthConstraint.constant = 2 * maxParallaxOffset;
        _parallaxImageViewHeightConstraint.constant = 0;
    }

}


-(void)setCurrentOrienration:(UIInterfaceOrientation)currentOrienration{

    _currentOrienration = currentOrienration;
    self.maxParallaxOffset = _maxParallaxOffset;

}


@end
