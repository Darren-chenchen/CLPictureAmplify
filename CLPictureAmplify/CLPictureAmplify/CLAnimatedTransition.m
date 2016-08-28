//
//  SKAnimatedTransitioning.m
//  Budayang
//
//  Created by darren on 16/3/24.
//  Copyright © 2016年 chinaPnr. All rights reserved.
//

#import "CLAnimatedTransition.h"
#import "UIView+CLFrame.h"

@implementation CLAnimatedTransition
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

// 在这个方法中实现转场动画 ：modal和dismis都调用这个方法
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (self.presented) {
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];

        toView.alpha = 0;

        [UIView animateWithDuration:0.5 animations:^{

            toView.alpha = 1;

        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    } else {
        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        [UIView animateWithDuration:0.5 animations:^{

            fromView.alpha = 0;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
        
    }
}
@end
