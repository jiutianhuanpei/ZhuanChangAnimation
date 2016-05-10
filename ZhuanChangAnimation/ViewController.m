//
//  ViewController.m
//  ZhuanChangAnimation
//
//  Created by shenhongbang on 16/5/6.
//  Copyright © 2016年 shenhongbang. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "SHBNavigationController.h"
#import "UIViewController+Helps.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
}

- (IBAction)toNextPage:(id)sender {
    
    TestViewController *test = [[TestViewController alloc] init];
//    [self.navigationController pushViewController:test animated:true];
    SHBNavigationController *na = [[SHBNavigationController alloc] initWithRootViewController:test];
    
    
    [self presentViewController:na animated:true completion:nil];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
