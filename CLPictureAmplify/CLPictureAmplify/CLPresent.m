//
//  SKCashPay.m
//  Budayang
//
//  Created by darren on 16/3/28.
//  Copyright © 2016年 chinaPnr. All rights reserved.
//

#import "CLPresent.h"
#import "CLCustomPresentationController.h"
#import "CLAnimatedTransition.h"

@implementation CLPresent

+ (CLPresent *)sharedCLPresent
{
    static id sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CLPresent alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - 控制器转场
#pragma mark - UIViewControllerTransitioningDelegate
//这个方法是说明哪个控制器控制presentatingController、presentatedController
- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[CLCustomPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}
// 自定义PresentedController的动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{   CLAnimatedTransition *anim = [[CLAnimatedTransition alloc] init];
    anim.presented = YES;
    return anim;  // 自己遵守UIViewControllerAnimatedTransitioning协议
}
// 自定义控制器消失时的动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    CLAnimatedTransition *anim = [[CLAnimatedTransition alloc] init];
    anim.presented = NO;
    return anim;
}

@end
