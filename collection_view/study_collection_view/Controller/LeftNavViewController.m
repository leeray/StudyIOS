//
//  LeftNavViewController.m
//  study_collection_view
//
//  Created by 李 瑞 on 13-4-2.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import "LeftNavViewController.h"

@interface LeftNavViewController ()

@property (weak, nonatomic) IBOutlet UIButton *hotBut;
@property (weak, nonatomic) IBOutlet UIButton *tvsBut;
@property (weak, nonatomic) IBOutlet UIButton *movBut;
@property (weak, nonatomic) IBOutlet UIButton *yulBut;
@property (weak, nonatomic) IBOutlet UIButton *cutBut;
@property (weak, nonatomic) IBOutlet UIButton *mucBut;
@property (weak, nonatomic) IBOutlet UIButton *funBut;

@end

@implementation LeftNavViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
