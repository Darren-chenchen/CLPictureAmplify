//
//  pictureCell.m
//  CLPictureAmplify
//
//  Created by darren on 16/8/25.
//  Copyright © 2016年 shanku. All rights reserved.
//

#import "pictureCell.h"

@interface pictureCell()
@property (weak, nonatomic) IBOutlet UIImageView *picView;

@end

@implementation pictureCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.picView.userInteractionEnabled = YES;
    [self.picView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImageForDismiss)]];
}

- (void)clickImageForDismiss
{
    self.clickCellImage();
}


- (void)setPicImg:(UIImage *)picImg
{
    _picImg = picImg;
    self.picView.image = picImg;
    self.picView.contentMode = UIViewContentModeScaleAspectFit;
}

@end
