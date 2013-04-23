//
//  DetailVideoViewController.m
//  study_collection_view
//
//  Created by 李 瑞 on 13-4-2.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import "DetailVideoViewController.h"
#import "RelateVideoCell.h"
#import "RelateVideoViewController.h"
#import "RelateVideoLayout.h"
#import <MediaPlayer/MediaPlayer.h>
#import <QuartzCore/QuartzCore.h>

@interface DetailVideoViewController (){
    CGRect _centerPanelRestingFrame;
    CGPoint _locationBeforePan;
    CGFloat _maximumAnimationDuration;
    CGFloat _bouncePercentage;
    CGFloat _bounceDuration;
}
@end

@implementation DetailVideoViewController
@synthesize vidStr;
@synthesize titleLabel;
@synthesize videoView;
@synthesize relateLabel;
@synthesize infoLabel;
@synthesize videoInfoRelateView;
@synthesize videoinfoconentLabel;
@synthesize relateVideoViewController;
@synthesize scrollbar;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    _maximumAnimationDuration = 0.2f;
    _bouncePercentage = 0.075f;
    _bounceDuration = 0.1f;
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    videoView = [[UIView alloc]initWithFrame:CGRectMake(5, 50, self.view.frame.size.width-10, self.view.frame.size.height/2)];
    videoView.backgroundColor = [UIColor blackColor];
    videoView.layer.cornerRadius = 3.0f;
    videoView.layer.masksToBounds = YES;
    videoView.layer.shadowRadius = 4.0f;
    videoView.layer.shadowOffset = CGSizeMake(5, 3);
    videoView.layer.shadowOpacity = 0.6;
    videoView.layer.shadowColor = [UIColor blackColor].CGColor;
    [self.view addSubview:videoView];
    
    infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, self.view.frame.size.height/2 + 5 + 50, (self.view.frame.size.width -10)/2, 20)];
    infoLabel.textAlignment = UITextAlignmentCenter;
    infoLabel.text = @"简介";
    infoLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:10.0f];
    infoLabel.backgroundColor = [UIColor clearColor];
    
    relateLabel = [[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width -10)/2 + 5, self.view.frame.size.height/2 + 5 + 50, (self.view.frame.size.width -10)/2, 20)];
    relateLabel.textAlignment = UITextAlignmentCenter;
    relateLabel.text = @"相关视频";
    relateLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:10.0f];
    relateLabel.backgroundColor = [UIColor clearColor];
    
    scrollbar = [[UIView alloc]initWithFrame:CGRectMake(5, self.view.frame.size.height/2 + 5 + 50, (self.view.frame.size.width -10)/2, 20)];
    scrollbar.backgroundColor = [UIColor whiteColor];
    scrollbar.opaque = YES;
    
    [self.view addSubview:scrollbar];
    [self.view addSubview:relateLabel];
    [self.view addSubview:infoLabel];
    
    
    
    videoInfoRelateView = [[UIScrollView alloc] initWithFrame:CGRectMake(5, self.view.frame.size.height/2 + 5 + 50 + 20, self.view.frame.size.width - 10, self.view.frame.size.height - 50 - videoView.frame.size.height - infoLabel.frame.size.height - 10)];
    videoInfoRelateView.delegate = self;
    videoInfoRelateView.contentSize = CGSizeMake(self.view.frame.size.width*2-20, self.view.frame.size.height - 50 - videoView.frame.size.height - infoLabel.frame.size.height - 10);
    videoInfoRelateView.pagingEnabled = YES;
    videoInfoRelateView.directionalLockEnabled = YES;
    videoInfoRelateView.showsHorizontalScrollIndicator = NO;
    videoInfoRelateView.showsVerticalScrollIndicator = NO;
    videoInfoRelateView.backgroundColor = [UIColor whiteColor];
    videoinfoconentLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, videoInfoRelateView.frame.size.width-10, videoInfoRelateView.frame.size.height)];
    videoinfoconentLabel.numberOfLines = 0;
    //[videoinfoconentLabel sizeToFit];
    videoinfoconentLabel.textAlignment = UITextAlignmentLeft;
    videoinfoconentLabel.text = @"dfkjsdalkfjsalkfjdskjfkdsajfklds";
    [videoInfoRelateView addSubview:videoinfoconentLabel];

    
    
    relateVideoViewController = [[RelateVideoViewController alloc]initWithCollectionViewLayout:[[RelateVideoLayout alloc] init]];
    relateVideoViewController.delegate = self;
    relateVideoViewController.collectionView.frame = CGRectMake(videoInfoRelateView.frame.size.width+5, 5, videoInfoRelateView.frame.size.width-10, self.view.frame.size.height - 50 - videoView.frame.size.height - infoLabel.frame.size.height - 10);
//    relateVideoViewController.view.center = CGPointMake(self.view.frame.size.width + self.view.frame.size.width/2, videoInfoRelateView.frame.size.height);
//    UIView *relateView = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width+5, 5, videoInfoRelateView.frame.size.width-10, videoInfoRelateView.frame.size.height)];
//    relateView.backgroundColor = [UIColor redColor];
//    [relateView addSubview:relateVideoViewController.view];
//    [videoInfoRelateView addSubview:relateView];
    
    [videoInfoRelateView addSubview:relateVideoViewController.collectionView];
    [relateVideoViewController getVideoRelate:vidStr];
    [self.view addSubview:videoInfoRelateView];
    
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(_handlePan:)];
    //panGesture.delegate = self;
    panGesture.maximumNumberOfTouches = 1;
    panGesture.minimumNumberOfTouches = 1;
    [self.view addGestureRecognizer:panGesture];
    
    
}

-(void)PlayMovie:(NSString *)movieURL
{
    NSLog(@"player URL:%@", movieURL);
    
    MPMoviePlayerViewController *movie_Player = [[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL fileURLWithPath:movieURL]];
    
    movie_Player.view.frame = CGRectMake(0, 0, 320, 240);
    [self.videoView addSubview:movie_Player.view];
    [self.view.superview setBackgroundColor:[UIColor clearColor]];
    [self.view setBackgroundColor:[UIColor clearColor]];
    
    [movie_Player moviePlayer];
    
}

- (void) PlayMovieFromUIWebView:(NSString *)movieURL{
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(1, 1, self.view.frame.size.width-12, self.view.frame.size.height/2 - 2)];
    webView.backgroundColor = [UIColor yellowColor];
    webView.opaque = NO;
    webView.layer.cornerRadius = 3.0f;
    webView.layer.masksToBounds = YES;
    webView.layer.shadowRadius = 4.0f;
    webView.layer.shadowOffset = CGSizeMake(5, 3);
    webView.layer.shadowOpacity = 0.6;
    webView.layer.shadowColor = [UIColor blackColor].CGColor;
    
    NSMutableString *content = [[NSMutableString alloc]initWithString:@"<html>"];
    [content appendString:@"<style>"];
    [content appendString:@"*{"];
    [content appendString:@"margin:0;"];
    [content appendString:@"padding:0;"];
    [content appendString:@"}"];
    [content appendString:@"</style>"];
    [content appendString:@"<div id=\"youkuplayer\"></div>"];
    [content appendString:@"<script type=\"text/javascript\" src=\"http://player.youku.com/jsapi\">"];
    [content appendString:@"player = new YKU.Player('youkuplayer',{"];
    [content appendString:@"client_id:'d68da6150f7d4460',"];
//    [content appendString:@"width:"];
//    [content appendString:[NSString stringWithFormat:@"%f", self.view.frame.size.width-10]];
//    [content appendString:@","];
//    [content appendString:@"height:"];
//    [content appendString:[NSString stringWithFormat:@"%f", self.view.frame.size.height/2]];
//    [content appendString:@","];
    [content appendString:@"vid:'"];
    [content appendString:movieURL];
    [content appendString:@"'"];
    [content appendString:@","];
    [content appendString:@"autoplay:true"];
    [content appendString:@"}"];
    [content appendString:@");"];
    [content appendString:@"</script>"];
    [content appendString:@"</html>"];

    
    [webView loadHTMLString:content baseURL:nil];
    
    //[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath: path]]];
    [videoView addSubview:webView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) getVideoDetail:(NSString*)vid{
    vidStr = vid;
    YoukuGetter *getter = [[YoukuGetter alloc]init];
    getter.delegate = self;
    [getter getVideoDetail:vid];
}

- (void) getVideoDetailOK:(VideoDetail*)result{
    videoinfoconentLabel.text = result.title;
    [videoinfoconentLabel sizeToFit];
    
    //[self PlayMovie:result.link];
    [self PlayMovieFromUIWebView: result.vid];
}

- (void) getRelateVideoDetail:(NSString *)vid{
    vidStr = vid;
    YoukuGetter *getter = [[YoukuGetter alloc]init];
    getter.delegate = self;
    [getter getVideoDetail:vid];
    
    [relateVideoViewController getVideoRelate:vid];
}

- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //NSLog(@"scrollViewWillBeginDragging");
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScroll WIDTH:%f", scrollView.contentOffset.x);
    float x_offset = (scrollView.contentOffset.x >= 10) ? scrollView.contentOffset.x/2 +5 : 5;
    scrollbar.frame = CGRectMake(x_offset, scrollbar.frame.origin.y, scrollbar.frame.size.width, scrollbar.frame.size.height);
}

- (void) scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //NSLog(@"scrollViewDidEndDragging");
}   
//
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"touchesBegan");
//}
//
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"touchesMoved");
//    UITouch *touch = touches.anyObject;
//    CGPoint curentTouchPosition = [touch locationInView:self.view];
//    self.view.frame = CGRectMake(curentTouchPosition.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
//}
//
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"touchesEnded");
//}


/*
 * 计算当前动画所需要的时间
 */
- (CGFloat)_calculatedDuration {
    CGFloat remaining = fabsf(self.view.frame.origin.x - _centerPanelRestingFrame.origin.x);
    CGFloat max = _locationBeforePan.x == _centerPanelRestingFrame.origin.x ? remaining : fabsf(_locationBeforePan.x - _centerPanelRestingFrame.origin.x);
    return max > 0.0f ? _maximumAnimationDuration * (remaining / max) : _maximumAnimationDuration;
}

- (void)_handlePan:(UIGestureRecognizer *)sender {
	
    if ([sender isKindOfClass:[UIPanGestureRecognizer class]]) {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)sender;
        
        
        CGPoint translate = [pan translationInView:self.view];
        CGRect frame = _centerPanelRestingFrame;
        
        
        if (pan.state == UIGestureRecognizerStateBegan) {
            _locationBeforePan = self.view.frame.origin;
            NSLog(@"begin x:%f  y:%f", _locationBeforePan.x, _locationBeforePan.y);
        
        }else if (sender.state == UIGestureRecognizerStateEnded || sender.state == UIGestureRecognizerStateCancelled) {
            CGFloat deltaX =  translate.x - _locationBeforePan.x;
            NSLog(@"deltaX:%f", deltaX);
            if (deltaX > self.view.frame.size.width/2){
                _centerPanelRestingFrame = CGRectMake(320, 0, self.view.frame.size.width, self.view.frame.size.height);
                [self _animateCenterPanel:NO completion:^(BOOL finished ){
                    
                }];
            } else {
                _centerPanelRestingFrame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
                [self _animateCenterPanel:NO completion:^(BOOL finished ){
                    
                }];
            }
            NSLog(@"end x:%f  y:%f", translate.x, translate.y);
        } else {
            if (translate.x > _locationBeforePan.x) {
                self.view.frame = CGRectMake(translate.x, 0, self.view.frame.size.width, self.view.frame.size.height);
                float alphaValue = translate.x / 100;
            }
        }
        
        
    }
}

- (void)_animateCenterPanel:(BOOL)shouldBounce completion:(void (^)(BOOL finished))completion {
    CGFloat bounceDistance = (_centerPanelRestingFrame.origin.x - self.view.frame.origin.x) * _bouncePercentage;
    if (_centerPanelRestingFrame.size.width > self.view.frame.size.width) {
        shouldBounce = NO;
    }
    
    CGFloat duration = [self _calculatedDuration];
    [UIView animateWithDuration:duration delay:0.0f options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionLayoutSubviews animations:^{
        self.view.frame = _centerPanelRestingFrame;
        [delegate DetailViewUnload];
    } completion:^(BOOL finished) {
        if (shouldBounce) {
            // make sure correct panel is displayed under the bounce
//            if (self.state == JASidePanelCenterVisible) {
//                if (bounceDistance > 0.0f) {
//                    [self _loadLeftPanel];
//                } else {
//                    [self _loadRightPanel];
//                }
//            }
            // animate the bounce
//            [UIView animateWithDuration:_bounceDuration delay:0.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
//                CGRect bounceFrame = _centerPanelRestingFrame;
//                bounceFrame.origin.x += bounceDistance;
//                self.view.frame = bounceFrame;
//            } completion:^(__unused BOOL finished2) {
//                [UIView animateWithDuration:_bounceDuration delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
//                    self.view.frame = _centerPanelRestingFrame;
//                } completion:completion];
//            }];
        } else if (completion) {
            completion(finished);
        }
    }];
    
    
}

@end
