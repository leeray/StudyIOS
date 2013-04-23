//
//  YoukuGetter.m
//  study_collection_view
//
//  Created by 李 瑞 on 13-3-28.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import "YoukuGetter.h"
#import "CategoryVideos.h"

#define CLIENTID @"d68da6150f7d4460"
#define CLIENTPID @""

@implementation YoukuGetter
@synthesize flag = _flag;
@synthesize delegate = _delegate;

-(void)getCategoryVideos:(NSString*)category genre:(NSString*)genre{
    NSString *urlString = @"https://openapi.youku.com/v2/videos/by_category.json";
    NSMutableString *urlGet = [NSMutableString stringWithFormat:@"%@?client_id=%@&category=%@&genre=%@", urlString, CLIENTID, category, genre];
    _flag = @"category";
    YoukuDownloader *downloader = [[YoukuDownloader alloc] init];
    downloader.delegate = self;
    [downloader startDownloadWithURLString: urlGet];
    
}

- (void) getVideoDetail:(NSString*)vid{
    NSString *urlString = @"https://openapi.youku.com/v2/videos/show_basic.json";
    NSMutableString *urlGet = [NSMutableString stringWithFormat:@"%@?client_id=%@&video_id=%@", urlString, CLIENTID, vid];
    _flag = @"videodetail";
    YoukuDownloader *downloader = [[YoukuDownloader alloc] init];
    downloader.delegate = self;
    [downloader startDownloadWithURLString: urlGet];
}

- (void) getVideoRelate:(NSString*)vid{
    NSString *urlString = @"https://openapi.youku.com/v2/videos/by_related.json";
    NSMutableString *urlGet = [NSMutableString stringWithFormat:@"%@?client_id=%@&video_id=%@", urlString, CLIENTID, vid];
    _flag = @"videorelate";
    YoukuDownloader *downloader = [[YoukuDownloader alloc] init];
    downloader.delegate = self;
    [downloader startDownloadWithURLString: urlGet];
}

-(void)YoukuDownloadFinishedWithResult:(NSData*)result{
    if ([_flag isEqual:@"category"]) {
        [self getCategoryVideosDone:result];
    }else if ([_flag isEqualToString:@"videodetail"]){
        [self getVideoDetailDone:result];
    }else if ([_flag isEqualToString:@"videorelate"]){
        [self getVideoRelateDone:result];
    }
}

-(void)getCategoryVideosDone:(NSData*)result{
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableLeaves error:&error];
    NSMutableArray *videoItems = [json objectForKey:@"videos"];
    
    NSMutableArray *resultArray = [NSMutableArray array];
    
    int count = [videoItems count];
    for (int i=count-1; i>=0; i--) {
        NSDictionary *videoList = [videoItems objectAtIndex:i];
        CategoryVideos *categoryVideoInfo = [[CategoryVideos alloc]init];
        NSString *vid = [videoList objectForKey:@"id"];
        NSString *title = [videoList objectForKey:@"title"];
        NSString *link = [videoList objectForKey:@"link"];
        NSString *thumbnail = [videoList objectForKey:@"thumbnail"];
        NSString *category = [videoList objectForKey:@"category"];
        NSArray *streamtypes = [videoList objectForKey:@"streamtypes"];
        NSInteger duration = [[videoList objectForKey:@"duration"] integerValue];
        
        categoryVideoInfo.vid = vid;
        categoryVideoInfo.title = title;
        categoryVideoInfo.link = link;
        categoryVideoInfo.thumbnail = thumbnail;
        categoryVideoInfo.category = category;
        categoryVideoInfo.streamtypes = streamtypes;
        categoryVideoInfo.duration = &duration;
        
        [resultArray addObject:categoryVideoInfo];
    }
    
    if(_delegate){
        struct YoukuCategoryInfo youkuCategoryInfo;
        youkuCategoryInfo.youkuCategroyInfo= resultArray;
        [_delegate getCategoryVideosOK:youkuCategoryInfo];
    }
}

-(void)getVideoDetailDone:(NSData*)result{
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableLeaves error:&error];
    
    VideoDetail *videoDetail = [[VideoDetail alloc]init];
    videoDetail.title = [json objectForKey:@"title"];
    videoDetail.description = [json objectForKey:@"description"];
    videoDetail.link = [json objectForKey:@"link"];
    videoDetail.player = [json objectForKey:@"player"];
    videoDetail.vid = [json objectForKey:@"id"];
    
    if(_delegate){
        [_delegate getVideoDetailOK:videoDetail];
    }
}

-(void)getVideoRelateDone:(NSData*)result{
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:result options:NSJSONReadingMutableLeaves error:&error];
    NSMutableArray *videoItems = [json objectForKey:@"videos"];
    
    NSMutableArray *resultArray = [NSMutableArray array];
    
    int count = [videoItems count];
    for (int i=count-1; i>=0; i--) {
        NSDictionary *videoList = [videoItems objectAtIndex:i];
        CategoryVideos *categoryVideoInfo = [[CategoryVideos alloc]init];
        NSString *vid = [videoList objectForKey:@"id"];
        NSString *title = [videoList objectForKey:@"title"];
        NSString *link = [videoList objectForKey:@"link"];
        NSString *thumbnail = [videoList objectForKey:@"thumbnail"];
        NSString *category = [videoList objectForKey:@"category"];
        NSArray *streamtypes = [videoList objectForKey:@"streamtypes"];
        NSInteger duration = [[videoList objectForKey:@"duration"] integerValue];
        
        categoryVideoInfo.vid = vid;
        categoryVideoInfo.title = title;
        categoryVideoInfo.link = link;
        categoryVideoInfo.thumbnail = thumbnail;
        categoryVideoInfo.category = category;
        categoryVideoInfo.streamtypes = streamtypes;
        categoryVideoInfo.duration = &duration;
        
        [resultArray addObject:categoryVideoInfo];
    }
    
    if(_delegate){
        struct YoukuCategoryInfo youkuCategoryInfo;
        youkuCategoryInfo.youkuCategroyInfo= resultArray;
        [_delegate getVideoRelateOK:youkuCategoryInfo];
    }
}

@end
