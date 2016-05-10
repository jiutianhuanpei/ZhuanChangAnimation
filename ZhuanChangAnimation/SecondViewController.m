//
//  SecondViewController.m
//  ZhuanChangAnimation
//
//  Created by shenhongbang on 16/5/8.
//  Copyright © 2016年 shenhongbang. All rights reserved.
//

#import "SecondViewController.h"
#import "UIViewController+Helps.h"

@implementation SecondViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    [self creatBtn:@"dismis" action:@selector(dismiss) y:300];
    
    
}

- (void)dismiss {
    
    [self dismissViewControllerAnimated:true completion:nil];
}

- (UIButton *)creatBtn:(NSString *)title action:(SEL)action y:(CGFloat)y {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn sizeToFit];
    btn.center = CGPointMake(CGRectGetWidth(self.view.frame) / 2., y);
    return btn;
}


@end
