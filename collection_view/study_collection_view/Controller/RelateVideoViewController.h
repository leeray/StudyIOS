//
//  RelateVideoViewController.h
//  study_collection_view
//
//  Created by 李 瑞 on 13-4-8.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YoukuGetter.h"

struct VideoRelateArray{
    NSMutableArray __unsafe_unretained *array;
};

@protocol RelateVideoViewControllerDelegate;

@interface RelateVideoViewController : UICollectionViewController <YoukuGetterDelegate>{
    struct VideoRelateArray videoRelateArray;
    NSMutableArray *imageArray;
}

@property (nonatomic, assign) NSInteger cellCount;

@property (strong, nonatomic) NSMutableArray *videosArray;

@property (nonatomic, assign) id<RelateVideoViewControllerDelegate> delegate;

- (void) getVideoRelate:(NSString*)vid;

@end

@protocol RelateVideoViewControllerDelegate <NSObject>

@optional
- (void) getRelateVideoDetail:(NSString *) vid;

@end
