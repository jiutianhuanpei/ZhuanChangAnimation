//
//  UIViewController+Helps.m
//  ZhuanChangAnimation
//
//  Created by shenhongbang on 16/5/8.
//  Copyright © 2016年 shenhongbang. All rights reserved.
//

#import "UIViewController+Helps.h"
#import <objc/runtime.h>

@implementation UIViewController (Helps)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        SEL viewdidload = @selector(viewDidLoad);
        SEL shbdidload = @selector(shbViewDidLoad);
        
        Method viewdidloadMethod = class_getInstanceMethod(class, viewdidload);
        Method shbviewdidloadMethod = class_getInstanceMethod(class, shbdidload);
        
        bool addDidLoad = class_addMethod(class, viewdidload, method_getImplementation(shbviewdidloadMethod), method_getTypeEncoding(shbviewdidloadMethod));
        if (addDidLoad) {
            class_replaceMethod(class, shbdidload, method_getImplementation(viewdidloadMethod), method_getTypeEncoding(viewdidloadMethod));
        } else {
            method_exchangeImplementations(viewdidloadMethod, shbviewdidloadMethod);
        }
        
        SEL viewDidUnload = @selector(viewDidUnload);
        SEL shbViewDidUnload = @selector(shbViewDidUnload);
        
        Method didUnloadMethod = class_getInstanceMethod(class, viewDidUnload);
        Method shbDidUnloadMethod = class_getInstanceMethod(class, shbViewDidUnload);
        
        bool addUnload = class_addMethod(class, viewDidUnload, method_getImplementation(shbDidUnloadMethod), method_getTypeEncoding(shbDidUnloadMethod));
        if (addUnload) {
            class_replaceMethod(class, shbViewDidUnload, method_getImplementation(didUnloadMethod), method_getTypeEncoding(didUnloadMethod));
        } else {
            method_exchangeImplementations(didUnloadMethod, shbDidUnloadMethod);
        }
        
        
        
    });
}

- (void)shbViewDidLoad {
    [self shbViewDidLoad];
    self.title = NSStringFromClass([self class]);
}

- (void)shbViewDidUnload {
    [self shbViewDidUnload];
    
    
}

@end
