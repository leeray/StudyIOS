//
//  CenterViewController.h
//  VideoRelate
//
//  Created by 李 瑞 on 13-4-12.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCollectionViewController.h"
#import "DetailVideoViewController.h"
#import "LeftNavViewController.h"

@interface CenterViewController : UIViewController <PhotoCollectionViewControllerDelegate, DetailVideoViewControllerDelegate, LeftNavViewControllerDelegate>

@property(nonatomic, strong) PhotoCollectionViewController *contentController;
@property(nonatomic, strong) DetailVideoViewController *detailController;
@property(nonatomic, strong) UIViewController *currentViewController;

@end
