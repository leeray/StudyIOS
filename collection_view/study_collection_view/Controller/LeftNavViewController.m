//
//  LeftNavViewController.m
//  study_collection_view
//
//  Created by 李 瑞 on 13-4-2.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import "LeftNavViewController.h"
#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"
#import "PhotoCollectionViewController.h"
#import <QuartzCore/QuartzCore.h>

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
@synthesize hotBut;
@synthesize tvsBut;
@synthesize movBut;
@synthesize yulBut;
@synthesize cutBut;
@synthesize mucBut;
@synthesize funBut;
@synthesize delegate;

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
    
    [hotBut addTarget:self action:@selector(_leftNavButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [tvsBut addTarget:self action:@selector(_leftNavButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [movBut addTarget:self action:@selector(_leftNavButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [yulBut addTarget:self action:@selector(_leftNavButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [cutBut addTarget:self action:@selector(_leftNavButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [mucBut addTarget:self action:@selector(_leftNavButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [funBut addTarget:self action:@selector(_leftNavButtonOnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    hotBut.layer.borderWidth = 0.1f;
    hotBut.layer.opaque = YES;
    hotBut.layer.shadowColor = [UIColor blueColor].CGColor ;
    hotBut.layer.shadowOpacity = 0.9;
    hotBut.layer.shadowOffset = CGSizeMake(0.0f, 3.0f);
    
    
    hotBut.backgroundColor = [UIColor blueColor];
    lastButton = hotBut;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)_leftNavButtonOnClick:(UIButton*)but{
//    UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
//    PhotoCollectionViewController *contentController = [board instantiateViewControllerWithIdentifier:@"contentController"];
//    [contentController loadCategoryVideo:[but currentTitle] genre:@""];
//    self.sidePanelController.centerPanel = contentController;
    [delegate leftNavButtonClick:[but currentTitle]];
    [delegate leftNavClickOnButton:but];
    
    [but setBackgroundColor:[UIColor blueColor]];
    
    NSLog(@"LeftNavViewController Button Position x:%f y:%f", but.frame.origin.x, but.bounds.origin.y);
    
    [lastButton setBackgroundColor:[UIColor clearColor]];
    
    lastButton = but;
    
}

@end
