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

@interface VideoRelateController (){
    NSDictionary *originTag;
}


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
    
    //NSArray *originKey = [@"1 2 3 4 5 6 7" componentsSeparatedByString:@" "];
    //NSArray *originValue = [NSArray arrayWithObjects:[NSArray arrayWithObject:@"(10, 0)", nil], [NSArray arrayWithObject:@"(10, 0)", nil], [NSArray arrayWithObject:@"(10, 0)", nil], [NSArray arrayWithObject:@"(10, 0)", nil], [NSArray arrayWithObject:@"(10, 0)", nil], [NSArray arrayWithObject:@"(10, 0)", nil], [NSArray arrayWithObject:@"(0, 0)", nil], nil];
    //originTag = [[NSDictionary alloc] initWithObjects:originValue forKeys:originKey];
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    
    self.viewController = [[JASidePanelController alloc] init];
    self.viewController.shouldDelegateAutorotateToVisiblePanel = YES;
    self.viewController.leftFixedWidth = 80.0;
    
    self.leftViewController = [board instantiateViewControllerWithIdentifier:@"leftController"];
    self.viewController.leftPanel = self.leftViewController;
    
    self.centerViewController = [[CenterViewController alloc]init];
    self.viewController.centerPanel = self.centerViewController;
    self.leftViewController.delegate = self;
    
    [self.view addSubview:self.viewController.view];
    
    tagView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 44)];
    [tagView setBackgroundColor:[UIColor blueColor]];
    [self.centerViewController.view addSubview:tagView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)leftNavButtonClick:(NSString*)category{
    NSLog(@"VideoRelateController leftNavButtonClick:%@", category);
    [self.centerViewController.contentController loadCategoryVideo:category genre:@""];
    [self.viewController showCenterPanelAnimated:YES];
}

- (void)leftNavClickOnButton:(UIButton*)button{
    int tag = [button tag];
    float tag_x = 0.0f;
    float tag_y = (tag-1) * 44;
    NSLog(@"VideoRelateController leftNavClickOnButton, tag_X:%f  tag_Y:%f", tag_x, tag_y);
    
    tagView.frame = CGRectMake(tag_x, tag_y, 20.0, 44.0f);
    //[self.centerViewController.view addSubview:tagView];
}

@end
