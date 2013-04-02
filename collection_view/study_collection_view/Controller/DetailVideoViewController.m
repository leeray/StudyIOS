//
//  DetailVideoViewController.m
//  study_collection_view
//
//  Created by 李 瑞 on 13-4-2.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import "DetailVideoViewController.h"

@interface DetailVideoViewController ()

@end

@implementation DetailVideoViewController
@synthesize titleLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 100, 20)];
    titleLabel.text = @"test";
    
    [self.view addSubview:titleLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
