//
//  VideosLayout.m
//  study_collection_view
//
//  Created by 李 瑞 on 13-4-1.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//
#define ITEM_SIZE 70
#define ITEM_WIDTH 140
#define ITEM_HEIGHT 190

#import "VideosLayout.h"
#import <QuartzCore/QuartzCore.h>

@implementation VideosLayout

-(void)prepareLayout
{
    [super prepareLayout];
    
    CGSize size = self.collectionView.frame.size;
    _cellCount = [[self collectionView] numberOfItemsInSection:0];
    _center = CGPointMake(size.width / 2.0, size.height / 2.0);
    _radius = MIN(size.width, size.height) / 2.5;
    
    _itemLandscapeCount = self.collectionView.frame.size.width / ITEM_WIDTH;
    _itemPortraitCount = self.collectionView.frame.size.height / ITEM_HEIGHT;
    
    _spaceWidth = (self.collectionView.frame.size.width -  _itemLandscapeCount * ITEM_WIDTH) / (_itemLandscapeCount + 1);
    _spaceHeight = 14.0f;
    
    NSLog(@"VideosLayout prepareLayout cellCount:%d  LandscapeCount:%d  PortraitCount:%d  spaceWidth:%f", _cellCount, _itemLandscapeCount, _itemPortraitCount, _spaceWidth);
}

- (CGSize)collectionViewContentSize{
    //return [self collectionView].frame.size;
    
    return CGSizeMake(self.collectionView.frame.size.width, (_cellCount / _itemLandscapeCount ) * ITEM_HEIGHT + (_cellCount / _itemLandscapeCount ) * _spaceHeight) ;;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path
{
    UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
    //attributes.size = CGSizeMake(ITEM_SIZE, ITEM_SIZE);
    //attributes.center = CGPointMake(_center.x + _radius * cosf(2 * path.item * M_PI / _cellCount),_center.y + _radius * sinf(2 * path.item * M_PI / _cellCount));
    
    attributes.size = CGSizeMake(ITEM_WIDTH, ITEM_HEIGHT);
    
    //算出在第几行？
    int itemY = (path.item / _itemLandscapeCount ) * ITEM_HEIGHT + ITEM_HEIGHT/2 + (path.item / _itemLandscapeCount) * _spaceHeight;
    
    //算出在第几列？
    int itemX = (path.item % _itemLandscapeCount == 0) ? ITEM_WIDTH/2 + _spaceWidth : ITEM_WIDTH + ITEM_WIDTH/2 + _spaceWidth + _spaceWidth/2;
    attributes.center = CGPointMake(itemX, itemY);
    
    NSLog(@"VideosLayout layoutAttributesForItemAtIndexPath cellCount:%d  LandscapeCount:%d  PortraitCount:%d  spaceWidth:%f", _cellCount, _itemLandscapeCount, _itemPortraitCount, _spaceWidth);
    NSLog(@"VideosLayout layoutAttributesForItemAtIndexPath item:%d  itemX:%d  itemY:%d", path.item, itemX, itemY);
    
    
    return attributes;
}

-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray* attributes = [NSMutableArray array];
    for (NSInteger i=0 ; i < self.cellCount; i++) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
    }
    return attributes;
}

- (UICollectionViewLayoutAttributes*) initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath{
    UICollectionViewLayoutAttributes* attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0.0;
    attributes.center = CGPointMake(_center.x, _center.y);
    return attributes;
}

- (UICollectionViewLayoutAttributes*) finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath{
    UICollectionViewLayoutAttributes* attributes = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    attributes.alpha = 0.0;
    attributes.center = CGPointMake(_center.x, _center.y);
    attributes.transform3D = CATransform3DMakeScale(0.1, 0.1, 1.0);
    return attributes;
}

@end
