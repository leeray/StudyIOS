//
//  YoukuGetter.h
//  study_collection_view
//
//  Created by 李 瑞 on 13-3-28.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YoukuDownloader.h"
#import "VideoDetail.h"

struct YoukuCategoryInfo{
    NSMutableArray __unsafe_unretained *youkuCategroyInfo;
};

@protocol YoukuGetterDelegate;

@interface YoukuGetter : NSObject <YoukuDownloaderDelegate>

@property (nonatomic, retain) id<YoukuGetterDelegate> delegate;
@property (nonatomic, retain) NSString *flag;

//根据分类获取视频 http://open.youku.com/docs/api/videos/by_category
- (void) getCategoryVideos:(NSString*)category genre:(NSString*)genre;

- (void) getVideoDetail:(NSString*)vid;

- (void) getVideoRelate:(NSString*)vid;

@end

@protocol YoukuGetterDelegate <NSObject>

@optional
- (void) getCategoryVideosOK:(struct YoukuCategoryInfo)result;

@optional
- (void) getVideoDetailOK:(VideoDetail*)result;

@optional
- (void) getVideoRelateOK:(struct YoukuCategoryInfo)result;


@end
