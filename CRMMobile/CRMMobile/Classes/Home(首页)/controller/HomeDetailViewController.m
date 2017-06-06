//
//  HomeDetailViewController.m
//  CRMMobile
//
//  Created by dagong on 2017/5/27.
//  Copyright © 2017年 dagong. All rights reserved.
//

#import "HomeDetailViewController.h"

@interface HomeDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation HomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnClick:(id)sender {
    
 //   if (self.returnValueBlock) {
    self.returnValueBlock(self.textField.text);
 //   }
    [self.navigationController popViewControllerAnimated:YES];
    
}



@end
