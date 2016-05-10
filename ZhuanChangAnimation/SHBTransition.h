//
//  SHBTransition.h
//  ZhuanChangAnimation
//
//  Created by shenhongbang on 16/5/6.
//  Copyright © 2016年 shenhongbang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SHBTransitionType) {
    SHBTransitionTypePush,   //系统push
    SHBTransitionTypePop,    //系统pop
    SHBTransitionTypePresent,//系统present
    SHBTransitionTypeDismiss,//向右消失
    SHBTransitionTypeDefaultDismiss,//系统 向下消失
};


@interface SHBTransition : NSObject<UIViewControllerAnimatedTransitioning>

+ (SHBTransition *)animatedTransitionWithDuration:(NSTimeInterval)duration type:(SHBTransitionType)type;

//@property (nonatomic, assign) SHBTransitionStyle style;

@end
