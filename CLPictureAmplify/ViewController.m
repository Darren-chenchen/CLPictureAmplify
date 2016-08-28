//
//  ViewController.m
//  CLPictureAmplify
//
//  Created by darren on 16/8/25.
//  Copyright © 2016年 shanku. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CLFrame.h"
#import "CLPictureAmplifyViewController.h"
#import "CLPresent.h"

@interface ViewController ()
/**图片数组*/
@property (nonatomic,strong) NSMutableArray *imageArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (NSMutableArray *)imageArray
{
    if (_imageArray == nil) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}
- (void)setupUI
{
    NSArray *urlImageArr = @[@"http://files.qiluzhaoshang.com//userheader/20160815/h2016081515512613355679328.png",@"http://files.qiluzhaoshang.com//userheader/20160815/h2016081515514613355679328.png",@"http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151027/pktvp21vq.jpg-w720",@"http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151217/40yfp068l.jpg-w720",@"http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151214/rx66ylk5r.jpg-w720",@"http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151217/4a9nyyog4.jpg-w720",@"http://7fvaoh.com3.z0.glb.qiniucdn.com/image/151130/8gbhyguv8.jpg-w720",@"http://files.qiluzhaoshang.com//userheader/20160815/h2016081515512613355679328.png"];
    
    UIView *picView = [[UIView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 0)];
    CGFloat magin = 1;
    CGFloat imageW = (self.view.frame.size.width-20-magin*3)/4;
    CGFloat imageH = imageW;
    CGFloat row = urlImageArr.count%4 ==0?  urlImageArr.count/4:urlImageArr.count/4+1;
    for (int i = 0; i < urlImageArr.count; i ++) {
        
        CGFloat imageX = 10 + (magin +imageW)*(i%4);
        CGFloat imageY = 10+ (1+imageH)*(i/4);
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
        img.tag = i;
        img.userInteractionEnabled = YES;
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:urlImageArr[i]]]];
        [self.imageArray addObject:image];
        UIImage *clickedImage = [self getPartOfImage:image rect:CGRectMake(0.5*(image.size.width-imageW), (image.size.height-imageH)*0.5, imageW, imageW)];
        img.image = clickedImage;
        [img addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)]];
        [picView addSubview:img];
    }
    picView.cl_h = 20+row*imageH+(row - 1)*5;
    [self.view addSubview:picView];
}
// 只显示图片中间的部分，其余部分点击放大显示
- (UIImage *)getPartOfImage:(UIImage *)img rect:(CGRect)partRect
{
    CGImageRef imageRef = img.CGImage;
    CGImageRef imagePartRef = CGImageCreateWithImageInRect(imageRef, partRect);
    UIImage *retImg = [UIImage imageWithCGImage:imagePartRef];
    CGImageRelease(imagePartRef);
    return retImg;
}

- (void)clickImage:(UITapGestureRecognizer *)gesture
{
    UIImageView *v = (UIImageView*)gesture.view;
    
    CLPictureAmplifyViewController *pictureVC = [[CLPictureAmplifyViewController alloc] init];
    // 传入图片数组
    pictureVC.picArray = self.imageArray;
    // 标记点击的是哪一张图片
    pictureVC.touchIndex = v.tag;
//    pictureVC.hiddenTextLable = YES;  // 控制lable是否显示
    CLPresent *present = [CLPresent sharedCLPresent];
    pictureVC.modalPresentationStyle = UIModalPresentationCustom;
    pictureVC.transitioningDelegate = present;
    [self presentViewController:pictureVC animated:YES completion:nil];
}

@end
