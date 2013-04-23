//
//  DetailViewPush.m
//  VideoRelate
//
//  Created by 李 瑞 on 13-4-11.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import "DetailViewPush.h"
#import "DetailVideoViewController.h"
#import "PhotoCollectionViewController.h"
#import "CategoryVideos.h"
#import "CenterViewController.h"

@implementation DetailViewPush

- (void)perform{
    NSLog(@"DetailViewPush prerfrom.");
    PhotoCollectionViewController *current = self.sourceViewController;
    NSIndexPath *selectedIndexPath = [[current.collectionView indexPathsForSelectedItems] objectAtIndex:0];
    CategoryVideos *categoryVideo = [current.categoryTableArray.tableArray objectAtIndex:[selectedIndexPath row]];

    CenterViewController *centerController = current.parentViewController;
    
    //DetailVideoViewController *detailVideoViewController = [[DetailVideoViewController alloc] init];
    DetailVideoViewController *detailVideoViewController = [centerController.childViewControllers objectAtIndex:1];
    [detailVideoViewController getVideoDetail:categoryVideo.vid];
    //detailVideoViewController.view.frame = CGRectMake(320, 0, 320, 480);
    NSLog(@"detailVideoViewController_2: %@", detailVideoViewController);
    
//    [current willMoveToParentViewController:current.parentViewController];
//    [current addChildViewController:detailVideoViewController];
    //[current didMoveToParentViewController:centerController];
    
//    [detailVideoViewController didMoveToParentViewController:current];
//    [current.view addSubview:detailVideoViewController.view];
    
    
    [centerController transitionFromViewController:current
                         toViewController:detailVideoViewController
                                 duration:2
                                  options:UIViewAnimationOptionTransitionNone
                               animations:^{
                                   detailVideoViewController.view.frame = CGRectMake(0, 0, 320, 480);
    }
                               completion:^(BOOL finished){
        if (finished) {
            //[current.view addSubview:detailVideoViewController.view];
        }else{
            
        }
    }];
}

@end
