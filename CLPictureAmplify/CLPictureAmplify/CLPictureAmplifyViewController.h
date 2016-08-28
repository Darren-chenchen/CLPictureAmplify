//
//  CLPictureAmplifyViewController.h
//  CLPictureAmplify
//
//  Created by darren on 16/8/25.
//  Copyright © 2016年 shanku. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CLPictureAmplifyViewController : UIViewController
@property (nonatomic,strong) NSArray *picArray;

@property (nonatomic,assign) NSInteger touchIndex;

/**是否要展示下面的lable*/
@property (nonatomic,assign) BOOL hiddenTextLable;

@end
