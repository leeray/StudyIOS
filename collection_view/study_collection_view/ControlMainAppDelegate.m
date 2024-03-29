//
//  ControlMainAppDelegate.m
//  study_collection_view
//
//  Created by 李 瑞 on 13-3-28.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import "ControlMainAppDelegate.h"
#import "PhotoCollectionViewController.h"
#import "VideosLayout.h"
#import "LeftNavViewController.h"
#import "CenterViewController.h"
#import "VideoRelateController.h"

@implementation ControlMainAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
//    UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
//
//    self.viewController = [[JASidePanelController alloc] init];
//    self.viewController.shouldDelegateAutorotateToVisiblePanel = YES;
//    self.viewController.leftFixedWidth = 80.0;
//    
//    LeftNavViewController *leftController = [board instantiateViewControllerWithIdentifier:@"leftController"];
//    //LeftNavViewController *leftController = [[LeftNavViewController alloc]initWithNibName:@"LeftNavViewController" bundle:nil];
//    self.viewController.leftPanel = leftController;
//    
//    //CenterViewController *centerController = [[CenterViewController alloc]initWithNibName:@"PhotoCollectionViewController" bundle:nil];
//    CenterViewController *centerController = [[CenterViewController alloc]init];
//    self.viewController.centerPanel = centerController;

    //self.viewController  = [[VideoRelateController alloc]init];
    //self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
