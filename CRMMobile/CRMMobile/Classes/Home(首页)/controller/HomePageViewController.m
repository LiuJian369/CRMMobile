//
//  HomePageViewController.m
//  CRMMobile
//
//  Created by dagong on 2017/5/27.
//  Copyright © 2017年 dagong. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomeDetailViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)backBtnClick:(id)sender {
    HomeDetailViewController *hdVC = [[HomeDetailViewController alloc]init];
    hdVC.returnValueBlock = ^(NSString *passedValue){
        self.label.text = passedValue;
        NSLog(@"%@", self.label.text);
    };
       
    [self.navigationController pushViewController:hdVC animated:YES];
    
}

@end
