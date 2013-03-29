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

@interface PhotoCollectionViewController : UICollectionViewController <UICollectionViewDelegate, YoukuGetterDelegate>{
    struct TableArray categoryTableArray;
}

@property (strong, nonatomic) NSMutableArray *photoImages;

@end
