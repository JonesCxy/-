//
//  ___________UITests.m
//  很好看的瀑布流展示效果UITests
//
//  Created by 华美赛佳 on 2017/3/7.
//  Copyright © 2017年 JonesCxy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CxyCollectionViewParallaxCell.h"
#import "CxyCollectionView.h"
#import "CxyCollectionViewLayout.h"

@interface FakeDataSource : NSObject <CxyCollectionViewDataSource>

@end

@implementation FakeDataSource

- (NSInteger)numberOfItemsInBnbCollectionView:(CxyCollectionView *)collectionView {
    NSLog(@"numberOfItemsInBnbCollectionView");
    
    return 10;
}

- (UICollectionViewCell *)bnbCollectionView:(CxyCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [[UICollectionViewCell alloc] init];
}

- (CxyCollectionViewParallaxCell *)bnbCollectionView:(CxyCollectionView *)collectionView parallaxCellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [[CxyCollectionViewParallaxCell alloc] init];
}

@end



@interface ___________UITests : XCTestCase

@end

@implementation ___________UITests{

    CxyCollectionViewLayout *_collectionViewLayout;
    CxyCollectionView *_collectionView;
    FakeDataSource *_dataSource;

}

- (void)setUp {
    [super setUp];
    
    _dataSource = [[FakeDataSource alloc] init];
    _collectionViewLayout = [[CxyCollectionViewLayout alloc] init];
    _collectionView = [[CxyCollectionView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) collectionViewLayout:_collectionViewLayout];
    _collectionView.dataSource = _dataSource;
    
    [_collectionView reloadData];

    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)testShouldInvalidLayout {
    CGRect zeroBounds = CGRectZero;
    CGRect shouldInvalidateBounds= CGRectMake(0, 0, 100, 100);
    
    XCTAssertFalse([_collectionViewLayout shouldInvalidateLayoutForBoundsChange: zeroBounds], @"Layout should not invalidate");
    XCTAssertTrue([_collectionViewLayout shouldInvalidateLayoutForBoundsChange: shouldInvalidateBounds], @"Layout should invalidate");
    XCTAssertFalse([_collectionViewLayout shouldInvalidateLayoutForBoundsChange: shouldInvalidateBounds], @"Layout should not invalidate");
    shouldInvalidateBounds.size.width = 200;
    XCTAssertTrue([_collectionViewLayout shouldInvalidateLayoutForBoundsChange: shouldInvalidateBounds], @"Layout should invalidate");
    shouldInvalidateBounds.size.height = 200;
    XCTAssertTrue([_collectionViewLayout shouldInvalidateLayoutForBoundsChange: shouldInvalidateBounds], @"Layout should invalidate");
}

- (void)testLayoutAttributesForHeader {
    XCTAssertNil([_collectionViewLayout layoutAttributesForSupplementaryViewOfKind:CxyCollectionElementKindHeader atIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]]);
}


- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
