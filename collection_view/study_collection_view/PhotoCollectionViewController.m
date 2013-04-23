//
//  PhotoCollectionViewController.m
//  study_collection_view
//
//  Created by 李 瑞 on 13-3-28.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import "PhotoCollectionViewController.h"
#import "CategoryVideos.h"
#import "DetailVideoViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface PhotoCollectionViewController ()

@end

@implementation PhotoCollectionViewController
@synthesize videosArray;
@synthesize cellCount;
@synthesize categoryTableArray;
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
	// Do any additional setup after loading the view.
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestrue:)];
    [self.collectionView addGestureRecognizer:tapGestureRecognizer];
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
    myCell.layer.borderWidth = 1.0f;
    myCell.layer.borderColor = [UIColor blackColor].CGColor;
    CategoryVideos *categoryVideo = [categoryTableArray.tableArray objectAtIndex:[indexPath row]];
    
//    UIImage *image;
//    if(!imageArray){
//        imageArray = [[NSMutableArray alloc]init];
//    }
//    if([imageArray count] <= [indexPath row]){
//        image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[categoryVideo thumbnail]]]];
//        NSLog(@"imageArray.count:%d indexPath.row:%d", [imageArray count], [indexPath row]);
//        [imageArray insertObject:image atIndex:[indexPath row]];
//    }else{
//        image = [imageArray objectAtIndex:[indexPath row]];
//        if(!image){
//            image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[categoryVideo thumbnail]]]];
//            [imageArray insertObject:image atIndex:[indexPath row]];
//        }
//    }
//    myCell.imageView.image = image;
    myCell.imageView.image = [imageArray objectAtIndex:[indexPath row]];
    
    
    myCell.nameLabel.numberOfLines = 0;
    myCell.nameLabel.text = [categoryVideo title];
    
    //NSLog(@"thumbnail:%@   title:%@", [categoryVideo thumbnail], [categoryVideo title]);
    
    return myCell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
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
    if(!imageArray){
        imageArray = [[NSMutableArray alloc]init];
    }
    
    self.cellCount = 0;
    
    for (CategoryVideos *categoryVideo in result.youkuCategroyInfo){
        [categoryTableArray.tableArray addObject:categoryVideo];
        [videosArray addObject:categoryVideo];
        
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[categoryVideo thumbnail]]]];
        [imageArray insertObject:image atIndex:self.cellCount];
        
        self.cellCount++;
    }
    
    NSLog(@"categoryTableArray.tableArray count():%d", [categoryTableArray.tableArray count]);
    
    [self.collectionView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@ viewWillAppear", self);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@ viewDidAppear", self);
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%@ viewWillDisappear", self);
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"%@ viewDidDisappear", self);
}

- (void)willMoveToParentViewController:(UIViewController *)parent {
    [super willMoveToParentViewController:parent];
    NSLog(@"%@ willMoveToParentViewController %@", self, parent);
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    [super didMoveToParentViewController:parent];
    NSLog(@"%@ didMoveToParentViewController %@", self, parent);
}

//- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if ([segue.identifier isEqualToString:@"DetailVideo"]) {
//        NSIndexPath *selectedIndexPath = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
//        CategoryVideos *categoryVideo = [categoryTableArray.tableArray objectAtIndex:[selectedIndexPath row]];
//        //DetailVideoViewController *detailVideoViewController = segue.destinationViewController;
//        //[detailVideoViewController getVideoDetail:categoryVideo.vid];
//        
//        /*self transitionFromViewController:<#(UIViewController *)#> toViewController:<#(UIViewController *)#> duration:<#(NSTimeInterval)#> options:<#(UIViewAnimationOptions)#> animations:<#^(void)animations#> completion:<#^(BOOL finished)completion#>
//         */
//    }
//}


- (void)handleTapGestrue:(UITapGestureRecognizer *)sender{
    NSLog(@"PhotoCollectionViewController collectionView handleTapGesture.");
    if (sender.state == UIGestureRecognizerStateEnded){
        CGPoint initialPinchPoint = [sender locationInView:self.collectionView];
        NSIndexPath* tappedCellPath = [self.collectionView indexPathForItemAtPoint:initialPinchPoint];
        
        if (tappedCellPath!=nil) {
            CategoryVideos *categoryVideo = [categoryTableArray.tableArray objectAtIndex:[tappedCellPath row]];
            [delegate videoClick:[categoryVideo vid]];
        }
        
    }
}

@end
