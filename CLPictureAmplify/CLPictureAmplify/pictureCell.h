//
//  pictureCell.h
//  CLPictureAmplify
//
//  Created by darren on 16/8/25.
//  Copyright © 2016年 shanku. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickCellImageBlock)();
@interface pictureCell : UICollectionViewCell
@property (nonatomic,strong) UIImage *picImg;

@property (nonatomic,strong) clickCellImageBlock clickCellImage;

@end
