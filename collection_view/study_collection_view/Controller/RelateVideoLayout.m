//
//  RelateVideoLayout.m
//  study_collection_view
//
//  Created by 李 瑞 on 13-4-8.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#define ITEM_WIDTH 95
#define ITEM_HEIGHT 80

#import "RelateVideoLayout.h"

@implementation RelateVideoLayout

- (void) prepareLayout{
    [super prepareLayout];
    
    CGSize size = self.collectionView.frame.size;
    _cellCount = [[self collectionView] numberOfItemsInSection:0];
    _center = CGPointMake(size.width / 2.0, size.height / 2.0);
    _radius = MIN(size.width, size.height) / 2.5;
    
    _itemLandscapeCount = self.collectionView.frame.size.width / ITEM_WIDTH;
    _itemPortraitCount = self.collectionView.frame.size.height / ITEM_HEIGHT;
    
    _spaceWidth = (self.collectionView.frame.size.width -  _itemLandscapeCount * ITEM_WIDTH) / (_itemLandscapeCount + 1);
    _spaceHeight = 10.0f;
    
    NSLog(@"RelateVideoLayout prepareLayout cellCount:%d   width:%f  height:%f  landscapeCount:%d  portraitCount:%d", _cellCount, self.collectionView.frame.size.width, self.collectionView.frame.size.height, _itemLandscapeCount, _itemPortraitCount);
}

- (CGSize)collectionViewContentSize{
    NSLog(@"RelateVideoLayout collectionViewContentSize");
    return CGSizeMake(self.collectionView.frame.size.width, (_cellCount / _itemLandscapeCount ) * ITEM_HEIGHT + (_cellCount / _itemLandscapeCount ) * _spaceHeight) ;
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSLog(@"RelateVideoLayout layoutAttributesForElementsInRect");
    NSMutableArray* attributes = [NSMutableArray array];
    for (NSInteger i=0 ; i < self.cellCount; i++) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    
    attributes.size = CGSizeMake(ITEM_WIDTH, ITEM_HEIGHT);
    
    //算出在第几行？
    int itemY = (indexPath.item / _itemLandscapeCount ) * ITEM_HEIGHT + ITEM_HEIGHT/2 + (indexPath.item / _itemLandscapeCount) * _spaceHeight;
    
    //算出在第几列？
    //int itemX = (indexPath.item % _itemLandscapeCount == 0) ? ITEM_WIDTH/2 + _spaceWidth : ITEM_WIDTH + ITEM_WIDTH/2 + _spaceWidth + _spaceWidth/2;
    int itemX = (indexPath.item % _itemLandscapeCount) * ITEM_WIDTH + ITEM_WIDTH/2 + (indexPath.item % _itemLandscapeCount) * _spaceWidth;
    
    NSLog(@"RelateVideoLayout layoutAttributesForItemAtIndexPath. indexPath:%d  (x:%d, y:%d)", indexPath.item, itemX, itemY);
    attributes.center = CGPointMake(itemX, itemY);
    
    
    return attributes;
}

- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath{
    UICollectionViewLayoutAttributes* attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    NSLog(@"RelateVideoLayout initialLayoutAttributesForAppearingItemAtIndexPath");
    attributes.alpha = 0.0;
    attributes.center = CGPointMake(_center.x, _center.y);
    return attributes;
}

- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath{
    UICollectionViewLayoutAttributes* attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    NSLog(@"RelateVideoLayout finalLayoutAttributesForDisappearingItemAtIndexPath");
    attributes.alpha = 0.0;
    attributes.center = CGPointMake(_center.x, _center.y);
    attributes.transform3D = CATransform3DMakeScale(0.1, 0.1, 1.0);
    return attributes;
}

@end
