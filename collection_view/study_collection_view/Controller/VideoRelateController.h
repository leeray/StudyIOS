//
//  VideoRelateController.h
//  VideoRelate
//
//  Created by 李 瑞 on 13-4-23.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JASidePanelController.h"
#import "CenterViewController.h"
#import "LeftNavViewController.h"

@interface VideoRelateController : UIViewController <LeftNavViewControllerDelegate>{
    UIView *tagView;
}

@property (strong, nonatomic) JASidePanelController *viewController;
@property (strong, nonatomic) CenterViewController *centerViewController;
@property (strong, nonatomic) LeftNavViewController *leftViewController;

@end
