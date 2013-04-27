//
//  LeftNavViewController.h
//  study_collection_view
//
//  Created by 李 瑞 on 13-4-2.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LeftNavViewControllerDelegate;

@interface LeftNavViewController : UITableViewController{
    UIButton *lastButton;
}

@property(strong, nonatomic) id<LeftNavViewControllerDelegate> delegate;

@end

@protocol LeftNavViewControllerDelegate <NSObject>

- (void)leftNavButtonClick:(NSString*)category;
- (void)leftNavClickOnButton:(UIButton*)button;

@end
