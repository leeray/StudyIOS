//
//  bottomTabView.m
//  study_tab_scrollview
//
//  Created by 李 瑞 on 13-3-20.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import "BottomTabView.h"
#import <QuartzCore/QuartzCore.h>

@implementation BottomTabView

@synthesize labelChannel;
@synthesize labelContent;
@synthesize labelOther;
@synthesize labelSource;
@synthesize labelTraffic;

@synthesize buttonChannel;
@synthesize buttonContent;
@synthesize buttonOther;
@synthesize buttonSource;
@synthesize buttonTraffic;

@synthesize bannerLineView;

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

-(void) setupWithFrame:(CGRect)frame delegate:(id)delegate{
    self.frame = frame;
    
    self.layer.shadowOffset = CGSizeMake(0, 3);
    self.layer.shadowRadius = 10.0;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 0.9;
    
    bannerLineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height-4, 60, 4)];
    bannerLineView.backgroundColor = [UIColor colorWithRed:255/255.0f green:2/255.0f blue:0/255.0f alpha:1.0f];
    
    [self addSubview:bannerLineView];
    
    bannerLineX = 0;
    
    labelArray = @[labelTraffic, labelSource, labelContent, labelChannel, labelOther];
    
    UILabel *defaultLabel = [labelArray objectAtIndex:0];
    defaultLabel.textColor = [UIColor colorWithRed:150/255.0f green:150/255.0f blue:150/255.0f alpha:1.0f];
    
    bannerLineIndex = 1;
    
}

-(IBAction)chooseModel:(UIButton*)button{
    int touch_index = button.tag;
    if (bannerLineIndex != touch_index) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        
        float bannerLineMoveX = touch_index * 64 +1;
        bannerLineView.transform = CGAffineTransformMakeTranslation(bannerLineMoveX, 0);
        
        UILabel *touchedLabelOld = [labelArray objectAtIndex:bannerLineIndex-1];
        touchedLabelOld.textColor = [UIColor colorWithRed:80/255.0f green:80/255.0f blue:80/255.0f alpha:1.0f];
        
        bannerLineIndex = touch_index+1;
        
        UILabel *touchedLabelNew = [labelArray objectAtIndex:bannerLineIndex-1];
        touchedLabelNew.textColor = [UIColor colorWithRed:150/255.0f green:150/255.0f blue:150/255.0f alpha:1.0f];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint touchPoints = [touch locationInView:self];
    float touch_x = touchPoints.x;
    
    int touch_label_num = touch_x / 64;
    
    if (bannerLineIndex != touch_label_num +1) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.2];
        
        float bannerLineMoveX = touch_label_num * 64 +1;
        bannerLineView.transform = CGAffineTransformMakeTranslation(bannerLineMoveX, 0);
        
        UILabel *touchedLabelOld = [labelArray objectAtIndex:bannerLineIndex-1];
        touchedLabelOld.textColor = [UIColor colorWithRed:80/255.0f green:80/255.0f blue:80/255.0f alpha:1.0f];
        
        bannerLineIndex = touch_label_num+1;
        
        UILabel *touchedLabelNew = [labelArray objectAtIndex:bannerLineIndex-1];
        touchedLabelNew.textColor = [UIColor colorWithRed:150/255.0f green:150/255.0f blue:150/255.0f alpha:1.0f];
    }
    
    
}

@end
