//
//  ControlMainAppDelegate.h
//  study_collection_view
//
//  Created by 李 瑞 on 13-3-28.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCollectionViewController.h"
#import "JASidePanelController.h"
#import "VideoRelateController.h"

@interface ControlMainAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//@property (strong, nonatomic) PhotoCollectionViewController *viewController;

//@property (strong, nonatomic) JASidePanelController *viewController;
@property (strong, nonatomic) VideoRelateController *viewController;

@end
