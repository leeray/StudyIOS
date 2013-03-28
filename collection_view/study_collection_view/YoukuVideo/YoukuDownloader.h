//
//  YoukuDownloader.h
//  study_collection_view
//
//  Created by 李 瑞 on 13-3-28.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YoukuDownloaderDelegate;

@interface YoukuDownloader : NSObject <NSURLConnectionDelegate>{
    NSMutableData *receivedData;
    NSURLConnection *downloadConnection;
    NSStringEncoding usingEncoding;
    id<YoukuDownloaderDelegate> delegate;
}
@property(retain,nonatomic)NSMutableData *receivedData; 
@property(retain,nonatomic)NSURLConnection *downloadConnection;
@property(retain,nonatomic)id<YoukuDownloaderDelegate> delegate;

-(void)startDownloadWithURLString:(NSString *)urlString;

@end

@protocol YoukuDownloaderDelegate <NSObject>

-(void)YoukuDownloadFinishedWithResult:(NSData*)result;

@end
