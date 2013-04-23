//
//  PhotoCollectionViewCell.m
//  study_collection_view
//
//  Created by 李 瑞 on 13-3-28.
//  Copyright (c) 2013年 李 瑞. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation PhotoCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.layer.borderWidth = 10.0f;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
//        self.layer.backgroundColor = [UIColor underPageBackgroundColor];
        self.contentView.layer.borderWidth = 10.0f;
        self.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.contentView.backgroundColor = [UIColor underPageBackgroundColor];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
