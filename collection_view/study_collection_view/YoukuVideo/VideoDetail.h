//
//  VideoDetail.h
//  study_collection_view
//
//  Created by 李 瑞 on 13-4-7.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoDetail : NSObject

@property (nonatomic, retain)NSString *vid;
@property (nonatomic, retain)NSString *title;
@property (nonatomic, retain)NSString *link;
@property (nonatomic, retain)NSString *thumbnail;
@property (nonatomic, assign)NSInteger *duration;
@property (nonatomic, retain)NSString *category;
@property (nonatomic, retain)NSArray *streamtypes;
@property (nonatomic, retain)NSString *description;
@property (nonatomic, retain)NSString *player;

@end
