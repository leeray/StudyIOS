//
//  ControlMainRootViewController.m
//  study_tab_scrollview
//
//  Created by 李 瑞 on 13-3-20.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import "ControlMainRootViewController.h"
#import "ControlMainModelController.h"
#import "ControlMainDataViewController.h"
#import "bottomTabView.h"

@interface ControlMainRootViewController ()
@property (readonly, strong, nonatomic) ControlMainModelController *modelController;
@end

@implementation ControlMainRootViewController

@synthesize modelController = _modelController;

- (void)viewDidLoad
{
    [super viewDidLoad];
//	// Do any additional setup after loading the view, typically from a nib.
//    // Configure the page view controller and add it as a child view controller.
//    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
//    self.pageViewController.delegate = self;
//
//    ControlMainDataViewController *startingViewController = [self.modelController viewControllerAtIndex:0 storyboard:self.storyboard];
//    NSArray *viewControllers = @[startingViewController];
//    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:NULL];
//
//    self.pageViewController.dataSource = self.modelController;
//
//    [self addChildViewController:self.pageViewController];
//    [self.view addSubview:self.pageViewController.view];
//
//    // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
//    CGRect pageViewRect = self.view.bounds;
//    self.pageViewController.view.frame = pageViewRect;
//
//    [self.pageViewController didMoveToParentViewController:self];
//
//    // Add the page view controller's gesture recognizers to the book view controller's view so that the gestures are started more easily.
//    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
    
    
//    NSArray *nils = [[NSBundle mainBundle]loadNibNamed:@"BottomTabView" owner:self options:nil];
//    bottomTabView = [nils objectAtIndex:0];
//    [bottomTabView setupWithFrame:CGRectMake(0, self.view.frame.size.height-40, 320, 40) delegate:self];
//    [self.view addSubview:bottomTabView];
    
    NSArray *nilsleft = [[NSBundle mainBundle]loadNibNamed:@"LeftNavUIView" owner:self options:nil];
    leftNavUIView = [nilsleft objectAtIndex:0];
    leftNavUIView.backgroundColor = [[UIColor alloc]initWithRed:100/255 green:100/255 blue:100/255 alpha:0.7];
    [leftNavUIView initWithFrame:CGRectMake(0, 0, 320, 480) delegate:self];
    [self.view addSubview:leftNavUIView];
    
    NSArray *nilsright = [[NSBundle mainBundle]loadNibNamed:@"RightNavUIView" owner:self options:nil];
    rightNavUIView = [nilsright objectAtIndex:0];
    rightNavUIView.backgroundColor = [UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f];
    [rightNavUIView initWithFrame:CGRectMake(0, 0, 320, 480) delegate:self];
    [self.view addSubview:rightNavUIView];
    
    
    NSLog(@"ControlMainRootViewController viewDidLoad frame.size.height:%f width:%f", self.view.frame.size.height, self.view.frame.size.width);
    NSLog(@"ControlMainRootViewController viewDidLoad bounds.size.height:%f width:%f", self.view.bounds.size.height, self.view.bounds.size.width);
    NSArray *nilscontent = [[NSBundle mainBundle]loadNibNamed:@"ContentUIView" owner:self options:nil];
    contentUIView = [nilscontent objectAtIndex:0];
    [contentUIView initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) delegate:self];
    [self.view addSubview:contentUIView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) bringViewtoBackground:(NSString*)viewStr{
    [self.view bringSubviewToFront:rightNavUIView];
}

- (void) bringUIViewToBack:(NSString*)viewStr{
    if ([viewStr isEqualToString:@"right"]) {
        //[leftNavUIView removeFromSuperview];
        [leftNavUIView setHidden:YES];
        [rightNavUIView setHidden:NO];
    } else if ([viewStr isEqualToString:@"left"]){
        //[rightNavUIView removeFromSuperview];
        [rightNavUIView setHidden:YES];
        [leftNavUIView setHidden:NO];
    } else {
        
    }
}

- (ControlMainModelController *)modelController
{
     // Return the model controller object, creating it if necessary.
     // In more complex implementations, the model controller may be passed to the view controller.
    if (!_modelController) {
        _modelController = [[ControlMainModelController alloc] init];
    }
    return _modelController;
}

#pragma mark - UIPageViewController delegate methods

/*
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    
}
 */

- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    // Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to YES, so set it to NO here.
    UIViewController *currentViewController = self.pageViewController.viewControllers[0];
    NSArray *viewControllers = @[currentViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:NULL];

    self.pageViewController.doubleSided = NO;
    return UIPageViewControllerSpineLocationMin;
}

@end
