//
//  ControlMainModelController.h
//  study_tab_scrollview
//
//  Created by 李 瑞 on 13-3-20.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ControlMainDataViewController;

@interface ControlMainModelController : NSObject <UIPageViewControllerDataSource>

- (ControlMainDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(ControlMainDataViewController *)viewController;

@end
