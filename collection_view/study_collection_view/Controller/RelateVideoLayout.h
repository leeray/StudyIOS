//
//  RelateVideoLayout.h
//  study_collection_view
//
//  Created by 李 瑞 on 13-4-8.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RelateVideoLayout : UICollectionViewLayout

@property (nonatomic, assign) NSInteger cellCount;
@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGFloat radius;

@property (nonatomic, assign) NSInteger itemLandscapeCount; //横向有几个？
@property (nonatomic, assign) NSInteger itemPortraitCount; //纵向有几个？
@property (nonatomic, assign) CGFloat spaceWidth; //平铺图标中间空余的空间？
@property (nonatomic, assign) CGFloat spaceHeight; //平铺图标上下间距?

@end
