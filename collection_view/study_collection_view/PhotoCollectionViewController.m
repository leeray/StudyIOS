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

@synthesize videosArray;

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
   
    NSLog(@"PhotoCollectionViewController numberOfSectionsInCollectionView");
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"PhotoCollectionViewController collectionView numberOfItemsInSecion categoryTableArray.tableArray.count:%d   videosArray.count:%d", [categoryTableArray.tableArray count], [videosArray count]);
    return [videosArray count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"PhotoCollectionViewController collectionView:cellForItemAtIndexPath:%d", [indexPath row]);
    PhotoCollectionViewCell *myCell = [collectionView
                                       dequeueReusableCellWithReuseIdentifier:@"photoCell"
                                       forIndexPath:indexPath];
    CategoryVideos *categoryVideo = [categoryTableArray.tableArray objectAtIndex:[indexPath row]];
    
    
    UIImage *image;
    image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[categoryVideo thumbnail]]]];
    myCell.imageView.image = image;
    
    myCell.nameLabel.numberOfLines = 0;
    myCell.nameLabel.text = [categoryVideo title];
    
    NSLog(@"thumbnail:%@   title:%@", [categoryVideo thumbnail], [categoryVideo title]);
    
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
    if(!categoryTableArray.tableArray){
        categoryTableArray.tableArray = [[NSMutableArray alloc]init];
    }
    if(!videosArray){
        videosArray = [[NSMutableArray alloc]init];
    }
    
    for (CategoryVideos *categoryVideo in result.youkuCategroyInfo){
        [categoryTableArray.tableArray addObject:categoryVideo];
        [videosArray addObject:categoryVideo];
    }
    
    NSLog(@"categoryTableArray.tableArray count():%d", [categoryTableArray.tableArray count]);
    
    [self.collectionView reloadData];
}


@end
