//
//  DetailVideoViewController.h
//  study_collection_view
//
//  Created by 李 瑞 on 13-4-2.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YoukuGetter.h"
#import "RelateVideoViewController.h"

@protocol DetailVideoViewControllerDelegate;

@interface DetailVideoViewController : UIViewController <YoukuGetterDelegate, RelateVideoViewControllerDelegate, UIScrollViewDelegate>
@property(nonatomic, retain) NSString *vidStr;
@property(nonatomic, retain) UILabel *titleLabel;
@property(nonatomic, retain) UIView *videoView;
@property(nonatomic, retain) UIScrollView *videoInfoRelateView;
@property(nonatomic, retain) UILabel *infoLabel;
@property(nonatomic, retain) UILabel *relateLabel;
@property(nonatomic, retain) UIView *scrollbar;
@property(nonatomic, retain) UILabel *videoinfoconentLabel;

@property(nonatomic, retain) RelateVideoViewController *relateVideoViewController;
@property(nonatomic, retain) id<DetailVideoViewControllerDelegate> delegate;

- (IBAction)close:(id)sender;

- (void) getVideoDetail:(NSString*)vid;

@end

@protocol DetailVideoViewControllerDelegate <NSObject>

-(void) DetailViewTapGesture:(float)alphaValue Affinex:(float)sx Affiney:(float)sy;

@end

