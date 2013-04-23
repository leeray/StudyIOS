//
//  CenterViewController.m
//  VideoRelate
//
//  Created by 李 瑞 on 13-4-12.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import "CenterViewController.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

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
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    PhotoCollectionViewController *contentController = [board instantiateViewControllerWithIdentifier:@"contentController"];
    [contentController loadCategoryVideo:@"热点" genre:@""];
    self.contentController = contentController;
    contentController.delegate = self;
    [self.view addSubview:contentController.view];
    [self addChildViewController:contentController];
    
    
    DetailVideoViewController *detailVideoViewController = [[DetailVideoViewController alloc] init];
    [self addChildViewController:detailVideoViewController];
    self.detailController = detailVideoViewController;
    detailVideoViewController.delegate = self;
    NSLog(@"detailVideoViewController_1: %@", detailVideoViewController);
    
    self.currentViewController = contentController;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) videoClick:(NSString*) vid{
    if (self.currentViewController == self.detailController) {
        return;
    }
    
    [self.detailController getVideoDetail:vid];
    
    //self.detailController.view.frame = CGRectMake(320, 0, 320, 480);

//    UIViewController *oldViewController = nil;;
//    [self transitionFromViewController:self.currentViewController
//                      toViewController:self.detailController
//                              duration:0.3
//                               options:UIViewAnimationOptionTransitionNone
//                            animations:nil
//                            completion:^(BOOL finished){
//                                if (finished) {
//                                    self.currentViewController = self.detailController;
//                                    self.currentViewController.view.frame = CGRectMake(0, 0, 320, 480);
//                                } else {
//                                    self.currentViewController = oldViewController;
//                                }
//                            }];
    
    
    
    //[self.view addSubview:self.detailController.view];
    
    
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:0.4];
    [self.view addSubview:self.detailController.view];
    self.detailController.view.frame = CGRectMake(320, 0, 320, 480);
    self.detailController.view.frame = CGRectMake(0, 0, 320, 480);
    CGAffineTransform transform = CGAffineTransformMakeRotation(0);
    transform = CGAffineTransformScale(transform, 0.98, 0.98);
    self.contentController.view.alpha = 0.5f;
    [self.contentController.view setTransform:transform];
    [UIView commitAnimations];
    
}

-(void)DetailViewUnload{
    CGAffineTransform transform = CGAffineTransformMakeRotation(0);
    transform = CGAffineTransformScale(transform, 1.0, 1.0);
    self.contentController.view.alpha = 1.0f;
    [self.contentController.view setTransform:transform];
}

-(void) DetailViewTapGesture:(float)alphaValue{
    CGAffineTransform transform = CGAffineTransformMakeRotation(0);
    transform = CGAffineTransformScale(transform, 1.0, 1.0);
    self.contentController.view.alpha = alphaValue;
    [self.contentController.view setTransform:transform];
}

@end
