//
//  ContentUIView.h
//  study_tab_scrollview
//
//  Created by 李 瑞 on 13-3-25.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BottomTabView.h"


@protocol ContentUIViewDelegate;

@interface ContentUIView : UIView{
    NSObject <ContentUIViewDelegate> *delegate;
    BottomTabView *bottomTabView;
    CGPoint leftPointCenter;
    CGPoint rightPointCenter;
    CGPoint closePointCenter;
    CGPoint currentPointCenter;
    BOOL orientation;
}

-(void)initWithFrame:(CGRect)frame delegate:(NSObject <ContentUIViewDelegate>*)contentUIViewDelegate;

@end

@protocol ContentUIViewDelegate <NSObject>

-(void) bringUIViewToBack:(NSString*)viewStr;

@end
