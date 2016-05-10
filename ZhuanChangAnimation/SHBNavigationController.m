//
//  SHBNavigationController.m
//  ZhuanChangAnimation
//
//  Created by shenhongbang on 16/5/8.
//  Copyright © 2016年 shenhongbang. All rights reserved.
//

#import "SHBNavigationController.h"
#import "SHBTransition.h"

NSTimeInterval const SHBNavigationControllerShowHiddenTime = 1;

@interface SHBNavigationController ()<UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>


@end

@implementation SHBNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.transitioningDelegate = self;
        self.delegate = self;
    }
    return self;
}

#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [SHBTransition animatedTransitionWithDuration:SHBNavigationControllerShowHiddenTime type:SHBTransitionTypePresent];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {

    return [SHBTransition animatedTransitionWithDuration:SHBNavigationControllerShowHiddenTime type:SHBTransitionTypeDismiss];
}

#pragma mark - UINavigationControllerDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    
    
    if (operation == UINavigationControllerOperationPush) {
        

        return [SHBTransition animatedTransitionWithDuration:SHBNavigationControllerShowHiddenTime type:SHBTransitionTypePush];
    }
    
    return [SHBTransition animatedTransitionWithDuration:SHBNavigationControllerShowHiddenTime type:SHBTransitionTypePop];
}


@end
