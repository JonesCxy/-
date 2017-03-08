//
//  ViewController.m
//  很好看的瀑布流展示效果
//
//  Created by 华美赛佳 on 2017/3/7.
//  Copyright © 2017年 JonesCxy. All rights reserved.
//

#import "ViewController.h"

#import "ParallaxCell.h"
#import "GridCell.h"
@interface ViewController ()

@end

@implementation ViewController{

    __weak IBOutlet CxyCollectionView *_collection;
    
    NSInteger _numberOfItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _numberOfItems = 10;
    [_collection registerNib:[UINib nibWithNibName:@"Header" bundle:nil] forSupplementaryViewOfKind:CxyCollectionElementKindHeader withReuseIdentifier:@"header"];
    
    
    
}

-(NSInteger)numberOfItemsInBnbCollectionView:(CxyCollectionView *)collectionView{

    return _numberOfItems;

}


-(UICollectionViewCell *)bnbCollectionView:(CxyCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    GridCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.label.text = [NSString stringWithFormat:@"Item %ld", indexPath.row];
    cell.imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"image-%ld", indexPath.row % 10 ]];
    
    return cell;

}

- (CxyCollectionViewParallaxCell *)bnbCollectionView:(CxyCollectionView *)collectionView parallaxCellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ParallaxCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"parallaxCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.parallaxImage = [UIImage imageNamed:[NSString stringWithFormat:@"image-%ld", indexPath.row % 10]];
    cell.label.text = [[NSString alloc] initWithFormat:@"Item %ld", (long)indexPath.row];
    
    return cell;
}

- (UICollectionReusableView *)bnbCollectionView:(CxyCollectionView *)collectionView headerAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *header = [_collection dequeueReusableSupplementaryViewOfKind: CxyCollectionElementKindHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    
    return header;
}

- (UIView *)bnbCollectionView:(CxyCollectionView *)collectionView moreLoaderAtIndexPath:(NSIndexPath *)indexPath {
    UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    view.color = [UIColor darkGrayColor];
    [view startAnimating];
    
    return view;
}

#pragma mark - NVBnbCollectionViewDelegate

- (void)loadMoreInBnbCollectionView:(CxyCollectionView *)collectionView {
    NSLog(@"loadMoreInBnbCollectionView:");
    if (_numberOfItems > 40) {
        collectionView.enableLoadMore = false;
        
        return;
    }
    _numberOfItems += 10;
    collectionView.loadingMore = false;
    [collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
