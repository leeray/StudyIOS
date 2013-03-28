//
//  PhotoCollectionViewController.m
//  study_collection_view
//
//  Created by 李 瑞 on 13-3-28.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import "PhotoCollectionViewController.h"
#import "CategoryVideos.h"

@interface PhotoCollectionViewController ()

@end

@implementation PhotoCollectionViewController

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
    
//    self.photoImages = [@[
//                        @"IMG_1.JPG",
//                        @"IMG_2.JPG",
//                        @"IMG_3.JPG",
//                        @"IMG_4.JPG",
//                        @"IMG_5.JPG",
//                        @"IMG_6.JPG",
//                        @"IMG_7.JPG",
//                        @"IMG_8.JPG",
//                        @"IMG_9.JPG",
//                        @"IMG_10.JPG",
//                        @"90s-girl.jpg",
//                        @"90s-girl-1.jpg",
//                        @"90s-girl-2.jpg",
//                        @"90s-girl-3.jpg"] mutableCopy];
    [self loadCategoryVideo:@"电影" genre:@"恐怖"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma delegate

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *myCell = [collectionView
                                       dequeueReusableCellWithReuseIdentifier:@"photoCell"
                                       forIndexPath:indexPath];
    
    
    UIImage *image;
    int row = [indexPath row];
    image = [UIImage imageNamed:self.photoImages[row]];
    myCell.imageView.image = image;
    return myCell;
}

#pragma 
-(void) loadCategoryVideo:(NSString*)category genre:(NSString*)genre{
    YoukuGetter *getter = [[YoukuGetter alloc]init];
    getter.delegate = self;
    [getter getCategoryVideos:category genre:genre];
}

#pragma delegate YoukuGetterDelegate
-(void) getCategoryVideosOK:(struct YoukuCategoryInfo)result{
    for (CategoryVideos *categoryVideo in result.youkuCategroyInfo){
        [categoryTableArray.tableArray addObject:categoryVideo];
    }
    
    NSLog(@"categoryTableArray.tableArray count():%d", [categoryTableArray.tableArray count]);
}


@end
