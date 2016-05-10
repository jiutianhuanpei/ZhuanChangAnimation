//
//  SHBTransition.m
//  ZhuanChangAnimation
//
//  Created by shenhongbang on 16/5/6.
//  Copyright © 2016年 shenhongbang. All rights reserved.
//

#import "SHBTransition.h"

@interface SHBTransition ()


@property (nonatomic, assign) NSTimeInterval    duration;
@property (nonatomic, assign) SHBTransitionType type;

@end


@implementation SHBTransition

+ (SHBTransition *)animatedTransitionWithDuration:(NSTimeInterval)duration type:(SHBTransitionType)type {
    SHBTransition *transition = [[SHBTransition alloc] initWithDuration:duration type:type];
    return transition;
}

- (instancetype)initWithDuration:(NSTimeInterval)duratin type:(SHBTransitionType)type
{
    self = [super init];
    if (self)
    {
        self.duration = duratin;
        self.type = type;
    }
    return self;
}

#pragma mark - UIViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return self.duration;;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    CGFloat width = CGRectGetWidth(containerView.frame);
    CGFloat height = CGRectGetHeight(containerView.frame);
    
    UIView *fromView = [fromVC.view snapshotViewAfterScreenUpdates:false];
    
    NSTimeInterval time = [self transitionDuration:transitionContext];
    
    
    switch (self.type) {
        case SHBTransitionTypePush: {
            [containerView addSubview:fromView];
            [containerView addSubview:toVC.view];
            toVC.view.frame = CGRectMake(width, 0, width, height);
            
            [UIView animateWithDuration:time animations:^{
                toVC.view.frame = containerView.bounds;
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:true];
            }];
            
            break;
        }
        case SHBTransitionTypePop: {
            [containerView addSubview:toVC.view];
            [containerView addSubview:fromView];
            fromView.frame = containerView.bounds;
            
            [UIView animateWithDuration:time animations:^{
                fromView.frame = CGRectMake(width, 0, width, height);
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:true];
            }];
            
            
            break;
        }
        case SHBTransitionTypePresent: {
            [containerView addSubview:fromView];
            [containerView addSubview:toVC.view];
            toVC.view.frame = CGRectMake(0, height, width, height);
            
            [UIView animateWithDuration:time animations:^{
                toVC.view.frame = containerView.bounds;
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:true];
            }];
            break;
        }
        case SHBTransitionTypeDismiss: {
            [containerView addSubview:toVC.view];
            [containerView addSubview:fromView];
            
            fromView.frame = containerView.bounds;
            
            
            [UIView animateWithDuration:time animations:^{
                fromView.frame = CGRectMake(-width, 0, width, height);
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:true];
            }];
            break;
        }
        case SHBTransitionTypeDefaultDismiss: {
            [containerView addSubview:toVC.view];
            [containerView addSubview:fromView];
            
            fromView.frame = containerView.bounds;
            
            [UIView animateWithDuration:time animations:^{
                fromView.frame = CGRectMake(0, height, width, height);
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:true];
            }];
            break;
        }
        default:
            break;
    }
}



@end
