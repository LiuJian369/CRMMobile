//
//  HomeDetailViewController.h
//  CRMMobile
//
//  Created by dagong on 2017/5/27.
//  Copyright © 2017年 dagong. All rights reserved.
//

#import "BaseViewController.h"

@interface HomeDetailViewController : BaseViewController

typedef void (^ReturnValueBlock) (NSString *strValue);
@property (nonatomic, copy) ReturnValueBlock returnValueBlock;

@end
