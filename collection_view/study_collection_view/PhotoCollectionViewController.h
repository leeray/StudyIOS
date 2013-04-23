//
//  PhotoCollectionViewController.h
//  study_collection_view
//
//  Created by 李 瑞 on 13-3-28.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCollectionViewCell.h"
#import "YoukuGetter.h"

struct TableArray{
    NSMutableArray __unsafe_unretained *tableArray;
};

@protocol PhotoCollectionViewControllerDelegate;

@interface PhotoCollectionViewController : UICollectionViewController <YoukuGetterDelegate>{
    //struct TableArray categoryTableArray;
    NSMutableArray *imageArray;
}

@property (nonatomic, assign) struct TableArray categoryTableArray;
@property (strong, nonatomic) NSMutableArray *photoImages;
@property (strong, nonatomic) NSMutableArray *videosArray;
@property (nonatomic, assign) NSInteger cellCount;

@property (nonatomic, assign) id<PhotoCollectionViewControllerDelegate> delegate;

-(void) loadCategoryVideo:(NSString*)category genre:(NSString*)genre;

@end

@protocol PhotoCollectionViewControllerDelegate <NSObject>

@optional
- (void) videoClick:(NSString*) vid;


@end
