//
//  BaseTableView.m
//  CRMMobile
//
//  Created by dagong on 2017/5/27.
//  Copyright © 2017年 dagong. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style andDelegate:(id)del
{
    if (self = [super initWithFrame:frame style:style]) {
        self.frame = frame ;
        self.dataSource =del;
        self.delegate = del;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = [UIColor clearColor];
        self.showsVerticalScrollIndicator = NO;
        self.tableFooterView = [[UIView alloc] init];
        //    // 下拉刷新
        //    self.tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRereshing)];
        //    // 上拉刷新
        //    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    }
    return self;
}

@end
