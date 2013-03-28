//
//  bottomTabView.h
//  study_tab_scrollview
//
//  Created by 李 瑞 on 13-3-20.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BottomTabViewDelegate;

@interface BottomTabView : UIView{
    UILabel *labelTraffic;
    UILabel *labelSource;
    UILabel *labelContent;
    UILabel *labelChannel;
    UILabel *labelOther;
    
    UIView *bannerLineView;
    
    float bannerLineX;
    float bannerLineY;
    int bannerLineIndex;
    
    NSArray *labelArray;
    
    UIButton *buttonTraffic;
    UIButton *buttonSource;
    UIButton *buttonContent;
    UIButton *buttonChannel;
    UIButton *buttonOther;
}

@property (nonatomic, retain) IBOutlet UILabel *labelTraffic;
@property (nonatomic, retain) IBOutlet UILabel *labelSource;
@property (nonatomic, retain) IBOutlet UILabel *labelContent;
@property (nonatomic, retain) IBOutlet UILabel *labelChannel;
@property (nonatomic, retain) IBOutlet UILabel *labelOther;

@property (nonatomic, retain) IBOutlet UIButton *buttonTraffic;
@property (nonatomic, retain) IBOutlet UIButton *buttonSource;
@property (nonatomic, retain) IBOutlet UIButton *buttonContent;
@property (nonatomic, retain) IBOutlet UIButton *buttonChannel;
@property (nonatomic, retain) IBOutlet UIButton *buttonOther;


@property (nonatomic, retain) UIView *bannerLineView;
//@property (nonatomic, retain) float bannerLineX;
//@property (nonatomic, retain) float bannerLineY;


-(void) setupWithFrame:(CGRect)frame delegate:(id)delegate;
-(IBAction) chooseModel:(UIButton*)button;

@end

@protocol BottomTabViewDelegate <NSObject>

@end
