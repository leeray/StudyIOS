//
//  RelateVideoCell.m
//  study_collection_view
//
//  Created by 李 瑞 on 13-4-8.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import "RelateVideoCell.h"

@implementation RelateVideoCell
@synthesize videoImg;
@synthesize videoTitle;
@synthesize videoImgView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];

        videoImg = [UIImage imageWithData:nil];
        videoImgView = [[UIImageView alloc] initWithImage:videoImg];
        videoImgView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/3*2);
        videoImgView.alpha = 1.0f;
        [self addSubview:videoImgView];
        
        videoTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height/3*2, self.frame.size.width, self.frame.size.height/3)];
        videoTitle.textColor = [UIColor blackColor];
        videoTitle.alpha = 0.8f;
//        videoTitle.backgroundColor = [UIColor clearColor];
        videoTitle.numberOfLines = 0;
        videoTitle.font = [UIFont fontWithName:@"Arial" size:10.0];
//        videoTitle.text = @"tesfsfasfasfasfsafsafsadfsadfdsafdst";
        [self addSubview:videoTitle];
        
    }
    return self;
}


//// Only override drawRect: if you perform custom drawing.
//// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
//    //NSLog(@"RelateVideoCell drawRect. width:%f  height:%f  title:%@", self.frame.size.width, self.frame.size.height, videoTitle.text);
//    // Drawing code
//    //UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
//    //[view setBackgroundColor:[UIColor whiteColor]];
//    videoTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
//    videoTitle.numberOfLines = 0;
//    videoTitle.font = [UIFont fontWithName:@"Arial" size:10.0];
//    videoTitle.textColor = [UIColor blackColor];
//    //videoTitle.text = @"tesfsfasfasfasfsafsafsadfsadfdsafdst";
//    [self addSubview:videoTitle];
//}


@end
