//
//  BaseViewController.m
//  CRMMobile
//
//  Created by dagong on 2017/5/27.
//  Copyright © 2017年 dagong. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@property (nonatomic,weak) Reachability *hostReach;

@end

@implementation BaseViewController

-(NSMutableArray *) items{
    if(!_items){
        
        _items = [NSMutableArray array];
        
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //监听网络变化
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    self.hostReach = reach;
    [[NSNotificationCenter defaultCenter]addObserver:self  selector:@selector(netStatusChange:) name:kReachabilityChangedNotification object:nil];
    //实现监听
    [reach startNotifier];
}

-(void)dealloc
{
    //移除通知
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

//通知监听回调 网络状态发送改变 系统会发出一个kReachabilityChangedNotification通知，然后会触发此回调方法
- (void)netStatusChange:(NSNotification *)noti{
       //判断网络状态
    switch (self.hostReach.currentReachabilityStatus) {
        case NotReachable:
   
        [MBProgressHUD showMessage:@"没有网络了" ToView:self.view RemainTime:2];
        break;
        case ReachableViaWiFi:
        NSLog(@"wifi上网2");
        break;
        case ReachableViaWWAN:
        NSLog(@"手机上网2");
        break;
        default:
        break;
    }
}


@end
