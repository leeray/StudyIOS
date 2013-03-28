//
//  ContentUIView.m
//  study_tab_scrollview
//
//  Created by 李 瑞 on 13-3-25.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#define OPENCENTERX 220.0

#import "ContentUIView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ContentUIView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)initWithFrame:(CGRect)frame delegate:(NSObject <ContentUIViewDelegate>*)contentUIViewDelegate{
    self.frame = frame;
    delegate = contentUIViewDelegate;
    
    leftPointCenter = CGPointMake(self.center.x - OPENCENTERX, self.center.y);
    rightPointCenter = CGPointMake(self.center.x + OPENCENTERX, self.center.y);
    closePointCenter = CGPointMake(self.center.x, self.center.y);
    currentPointCenter = self.center;
    
    
    self.layer.shadowOffset = CGSizeMake(0, 3);
    self.layer.shadowRadius = 10.0;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 0.9;
    self.layer.cornerRadius = 5.0;
    self.layer.masksToBounds = NO;
    
    NSLog(@"contentUIView initWithFrame bounds.size.height:%f width:%f", self.bounds.size.height, self.bounds.size.width);
    NSLog(@"contentUIView initWithFrame frame.size.height:%f width:%f", self.frame.size.height, self.frame.size.width);
    NSArray *nils = [[NSBundle mainBundle]loadNibNamed:@"BottomTabView" owner:self options:nil];
    bottomTabView = [nils objectAtIndex:0];
    [bottomTabView setupWithFrame:CGRectMake(0, self.bounds.size.height-40, 320, 40) delegate:self];
    [self addSubview:bottomTabView];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    [self addGestureRecognizer:panGestureRecognizer];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:tapGestureRecognizer];

}


-(void)handlePan:(UIPanGestureRecognizer*) recognizer{
    CGPoint translation = [recognizer translationInView:self];
    float x = 0.0;
    NSLog(@"contentUIView translation x:%f  y:%f", translation.x, translation.y);
    NSLog(@"contentUIView current x:%f  y:%f", currentPointCenter.x, currentPointCenter.y);
    NSLog(@"contentUIView left x:%f  y:%f", leftPointCenter.x, leftPointCenter.y);
    NSLog(@"contentUIView right x:%f  y:%f", rightPointCenter.x, rightPointCenter.y);
    
    if (currentPointCenter.x == closePointCenter.x){
        //原始位置
        if(translation.x >=0){
            //往→滑动
            x = translation.x + closePointCenter.x;
            [delegate bringUIViewToBack:@"left"];
        }else{
            //往←滑动
            x = translation.x + closePointCenter.x;
            [delegate bringUIViewToBack:@"right"];
        }
        
    }else if(currentPointCenter.x == leftPointCenter.x){
        //当前在左边
        if(translation.x >=0){
            //往→滑动
            x = translation.x + leftPointCenter.x;
        }else{
            //往←滑动
            x = translation.x + leftPointCenter.x;
        }
        
    }else if(currentPointCenter.x == rightPointCenter.x){
        //当前在右边
        if(translation.x >=0){
            //往→滑动
            x = translation.x + rightPointCenter.x;
        }else{
            //往←滑动
            x = translation.x + rightPointCenter.x;
        }
        
    }else{
        x = translation.x + closePointCenter.x;
    }
    
    self.center = CGPointMake(x, currentPointCenter.y);
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.15
                              delay:0.00
                            options:UIViewAnimationCurveEaseInOut
                         animations:^(void){
                             if (currentPointCenter.x == closePointCenter.x){
                                 NSLog(@"在中间。。。。x:%f",x);
                                 if (x > rightPointCenter.x - 70.0) {
                                     self.center = rightPointCenter;
                                 }else if(x < leftPointCenter.x + 70){
                                     self.center = leftPointCenter;
                                 }else{
                                     self.center = currentPointCenter;
                                 }
                                 
                             }else if(currentPointCenter.x == leftPointCenter.x){
                                 NSLog(@"在左边。。。。x:%f",x);
                                 if(x > leftPointCenter.x + 70){
                                     self.center = closePointCenter;
                                 }else{
                                     self.center = currentPointCenter;
                                 }
                                 
                             }else if(currentPointCenter.x == rightPointCenter.x){
                                 NSLog(@"在右边。。。。x:%f",x);
                                 if(x < rightPointCenter.x - 70){
                                     self.center = closePointCenter;
                                 }else{
                                     self.center = currentPointCenter;
                                 }
                                 
                             }else{
                                 self.center = currentPointCenter;
                             }

                         }completion:^(BOOL isFinished){
                             
                         }];
        currentPointCenter = self.center;
    }
}

-(void)handleTap:(UITapGestureRecognizer*) recognizer{
    recognizer.cancelsTouchesInView = NO;
    NSLog(@"contentUIView handleTap.");
    [UIView animateWithDuration:0.15
                          delay:0.00
                        options:UIViewAnimationTransitionCurlUp
                     animations:^(void){
                            self.center = closePointCenter;
                        }completion:nil];
    currentPointCenter = self.center;
}

@end
