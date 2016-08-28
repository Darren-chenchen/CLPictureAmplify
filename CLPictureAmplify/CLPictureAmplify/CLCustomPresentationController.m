//
//  CoustomPresentationController.m
//  Budayang
//
//  Created by darren on 16/3/24.
//  Copyright © 2016年 chinaPnr. All rights reserved.
//

#import "CLCustomPresentationController.h"

@implementation CLCustomPresentationController
- (void)presentationTransitionWillBegin
{
    self.presentedView.frame = CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    [self.containerView addSubview:self.presentedView];
}

- (void)presentationTransitionDidEnd:(BOOL)completed
{
    
}

- (void)dismissalTransitionWillBegin
{
    
}

- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    [self.presentedView removeFromSuperview];
}
@end
