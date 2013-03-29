//
//  YoukuDownloader.m
//  study_collection_view
//
//  Created by 李 瑞 on 13-3-28.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import "YoukuDownloader.h"

@implementation YoukuDownloader
@synthesize receivedData;
@synthesize downloadConnection;
@synthesize delegate;

//方法功能：启动下载(根据URL地址)
-(void)startDownloadWithURLString:(NSString *)urlString
{
    if(self.downloadConnection==nil){
        self.receivedData=[NSMutableData data];
        NSString *escapedUrlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL* url = [NSURL URLWithString:escapedUrlString];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:url];
        
        NSURLConnection *connection=[[NSURLConnection alloc]initWithRequest:request delegate:self];
        
        self.downloadConnection=connection;
        if(downloadConnection == nil)
        {
            return;
        }
        NSLog(@"request URL: %@", url  );
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];//开启状态栏风火轮
    }
}

//方法功能：取消下载
-(void)cancelDownload{
    [self.downloadConnection cancel];
    self.downloadConnection=nil;
    self.receivedData=nil;
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];//关闭状态栏风火轮
}

//方法功能：通过response的响应，判断是否连接存在
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"链接不存在");
}


//方法功能：通过data获得请求后，返回的数据，数据类型NSData
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receivedData appendData:data];
}

//方法功能：返回的错误信息
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    self.receivedData=nil;
    self.downloadConnection=nil;
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];//关闭状态栏风火轮
}

//方法功能：数据请求完毕，这个时候，用法是多线程的时候，通过这个通知，关部子线程
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    NSStringEncoding gbkEncoding =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString*string = [[NSString alloc] initWithData:receivedData encoding:gbkEncoding];
    NSLog(@"数据请求完毕 %@",string);
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:NO];//关闭状态栏风火轮
    if(self.delegate){
        [delegate YoukuDownloadFinishedWithResult:receivedData];
    }else {
        NSLog(@"Nil");
    }
    self.receivedData=nil;
    self.downloadConnection=nil;
}

@end
