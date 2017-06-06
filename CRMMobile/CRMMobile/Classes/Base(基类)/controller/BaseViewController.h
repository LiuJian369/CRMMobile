//
//  BaseViewController.h
//  CRMMobile
//
//  Created by dagong on 2017/5/27.
//  Copyright © 2017年 dagong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
/** 页数 */
@property (nonatomic, assign) int page;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) UITableView *tableView;

@end
