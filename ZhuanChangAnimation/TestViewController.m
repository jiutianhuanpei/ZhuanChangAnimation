//
//  TestViewController.m
//  ZhuanChangAnimation
//
//  Created by shenhongbang on 16/5/7.
//  Copyright © 2016年 shenhongbang. All rights reserved.
//

#import "TestViewController.h"
#import "SecondViewController.h"
#import "UIViewController+Helps.h"

@interface TestViewController ()


@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    [self creatBtn:@"Push to Second" action:@selector(dismiss) y:300];
    
    
}

- (void)dismiss {
    SecondViewController *second = [[SecondViewController alloc] init];
    [self.navigationController pushViewController:second animated:true];

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
