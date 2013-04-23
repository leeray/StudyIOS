//
//  RelateVideoViewController.m
//  study_collection_view
//
//  Created by 李 瑞 on 13-4-8.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import "RelateVideoViewController.h"
#import "RelateVideoCell.h"
#import "YoukuGetter.h"
#import "CategoryVideos.h"

@interface RelateVideoViewController ()

@end

@implementation RelateVideoViewController
@synthesize delegate;


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
	// Do any additional setup after loading the
    
    NSLog(@"collectionView viewDidLoad.");
    
    [self.collectionView registerClass:[RelateVideoCell class] forCellWithReuseIdentifier:@"RElATE_CELL"];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestrue:)];
    [self.collectionView addGestureRecognizer:tapGestureRecognizer];
    
    
}

- (void) getVideoRelate:(NSString*)vid{
    YoukuGetter *getter = [[YoukuGetter alloc]init];
    getter.delegate = self;
    [getter getVideoRelate:vid];
}

-(void) getVideoRelateOK:(struct YoukuCategoryInfo)result{
    
    [self.collectionView registerClass:[RelateVideoCell class] forCellWithReuseIdentifier:@"RElATE_CELL"];
    
//    if(!videoRelateArray.array){
        videoRelateArray.array = [[NSMutableArray alloc]init];
//    }
//    if (!imageArray) {
        imageArray = [[NSMutableArray alloc]init];
//    }
    self.cellCount = 0;
    
    for (CategoryVideos *categoryVideo in result.youkuCategroyInfo){
        
        [videoRelateArray.array addObject:categoryVideo];
        
        
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[categoryVideo thumbnail]]]];
        [imageArray insertObject:image atIndex:self.cellCount];
        
        self.cellCount = self.cellCount + 1;
    }
    
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    RelateVideoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RElATE_CELL" forIndexPath:indexPath];
    
    CategoryVideos *categoryVideo = [videoRelateArray.array objectAtIndex:[indexPath row]];
    
    cell.videoImgView.image = [imageArray objectAtIndex:[indexPath row]];
    
    cell.videoTitle.text = [categoryVideo title];
    
    NSLog(@"collectionView cellForItemAtIndexPath. relatetitle:%@   image:%@", [categoryVideo title], cell.videoImg);
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSLog(@"collectionView numberOfItemsInSection cellCount:%d", self.cellCount);
    return self.cellCount;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    NSLog(@"collectionView numberOfSectionsInCollectionView");
    return 1;
}

- (void)handleTapGestrue:(UITapGestureRecognizer *)sender{
    NSLog(@"RelateVideoViewController collectionView handleTapGesture.");
    if (sender.state == UIGestureRecognizerStateEnded){
        CGPoint initialPinchPoint = [sender locationInView:self.collectionView];
        NSIndexPath* tappedCellPath = [self.collectionView indexPathForItemAtPoint:initialPinchPoint];
        
        if (tappedCellPath!=nil) {
            CategoryVideos *categoryVideo = [videoRelateArray.array objectAtIndex:[tappedCellPath row]];
            [delegate getRelateVideoDetail:[categoryVideo vid]];
        }

    }
}

@end
