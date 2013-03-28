//
//  ControlMainRootViewController.h
//  study_tab_scrollview
//
//  Created by 李 瑞 on 13-3-20.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BottomTabView.h"
#import "LeftNavUIView.h"
#import "ContentUIView.h"
#import "RightNavUIView.h"

@interface ControlMainRootViewController : UIViewController <UIPageViewControllerDelegate, ContentUIViewDelegate>{
    BottomTabView *bottomTabView;
    LeftNavUIView *leftNavUIView;
    ContentUIView *contentUIView;
    RightNavUIView *rightNavUIView;
}

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end
