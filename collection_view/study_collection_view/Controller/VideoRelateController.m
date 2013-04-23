//
//  VideoRelateController.m
//  VideoRelate
//
//  Created by 李 瑞 on 13-4-23.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import "VideoRelateController.h"
#import "LeftNavViewController.h"
#import "CenterViewController.h"

@interface VideoRelateController ()

@end

@implementation VideoRelateController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

//- (id)init{
//    UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
//    
//    self.viewController = [[JASidePanelController alloc] init];
//    self.viewController.shouldDelegateAutorotateToVisiblePanel = YES;
//    self.viewController.leftFixedWidth = 80.0;
//    
//    LeftNavViewController *leftController = [board instantiateViewControllerWithIdentifier:@"leftController"];
//    self.viewController.leftPanel = leftController;
//    
//    CenterViewController *centerController = [[CenterViewController alloc]init];
//    self.viewController.centerPanel = centerController;
//    
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    self.viewController = [[JASidePanelController alloc] init];
    self.viewController.shouldDelegateAutorotateToVisiblePanel = YES;
    self.viewController.leftFixedWidth = 80.0;
    
    LeftNavViewController *leftController = [board instantiateViewControllerWithIdentifier:@"leftController"];
    self.viewController.leftPanel = leftController;
    
    CenterViewController *centerController = [[CenterViewController alloc]init];
    self.viewController.centerPanel = centerController;
    
    [self.view addSubview:self.viewController.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
