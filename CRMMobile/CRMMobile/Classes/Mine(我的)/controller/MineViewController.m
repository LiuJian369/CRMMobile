//
//  MineViewController.m
//  CRMMobile
//
//  Created by dagong on 2017/5/27.
//  Copyright © 2017年 dagong. All rights reserved.
//

#import "MineViewController.h"
#import "ZJUsefulPickerView.h"

@interface MineViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic,strong) NSArray *letter;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIPickerView *pick = [[UIPickerView alloc]initWithFrame:CGRectMake(30, 100, SCREEN_WIDTH-60, 200)];
   // [pick setValue:@"顺丰" forKey:@"1"];
    pick.delegate = self;
    pick.dataSource = self;
    [self loadData];
    [self.view addSubview:pick];
   
    UIButton *btn = [QuickControl createButtonWithFrame:CGRectMake(100, 300, 50, 50) backgroundColor:[UIColor orangeColor] title:@"nihao" titleColor:[UIColor blackColor] font:FONT(12) target:self action:@selector(btnClick:)];
    [self.view addSubview:btn];
    
    
}

-  (void)btnClick:(UIButton *)btn{
    
    
    
//    UIView *tview = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 300)];
//    tview.backgroundColor = [UIColor orangeColor];
//    [self.view addSubview:tview];
//    [UIView animateWithDuration:1 animations:^{
//        tview.frame = CGRectMake(0, SCREEN_HEIGHT-64-300  , SCREEN_WIDTH, 300);
//    }];
//    
//    [[UIApplication sharedApplication].keyWindow addSubview:tview];
    
//    [ZJUsefulPickerView showSingleColPickerWithToolBarText:@"借款期限" withData:@[@"1个月", @"3个月", @"6个月", @"9个月", @"12个月"] withDefaultIndex:3 withCancelHandler:^{
//        NSLog(@"quxiaole -----");
//        
//    } withDoneHandler:^(NSInteger selectedIndex, NSString *selectedValue) {
//        NSLog(@"%@---%ld", selectedValue, selectedIndex);
//       // self.monthLabel.text = selectedValue;
//        //  self.monthIndex = selectedIndex;
//        
//        if (selectedIndex == 0){
//          //  self.monthIndex = @"1";
//        }else if (selectedIndex == 1){
//          //  self.monthIndex = @"3";
//        }else if (selectedIndex == 2){
//           // self.monthIndex = @"6";
//        }else if (selectedIndex == 3){
//           // self.monthIndex = @"9";
//        }else if (selectedIndex == 4){
//          //  self.monthIndex = @"12";
//        }
//    }];
}

// 监听键盘
-(void) keyBoardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

-(void) keyBoardWillShow:(NSNotification *)n {
    NSLog(@"%@",n.userInfo);
    // 用于区别点击的是哪个textfield

    CGFloat time = [[n.userInfo objectForKey:@"UIKeyboardAnimationDurationUserInfoKey"] floatValue];
    CGFloat h = [[n.userInfo objectForKey:@"UIKeyboardBoundsUserInfoKey"] CGRectValue].size.height;
    [UIView animateWithDuration:time animations:^{
        //        设置聊天页面跟随视图偏移
        //        self.view.frame = CGRectMake(0, -h, ScreenWidth, ScreenHeight);

        [self.view layoutIfNeeded];
    }];
}
//键盘将要隐藏
-(void) keyBoardWillHide:(NSNotification *)n {
    CGFloat time = [[n.userInfo objectForKey:@"UIKeyboardAnimationDurationUserInfoKey"] floatValue];
    [UIView animateWithDuration:time animations:^{
        //        self.view.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
 //       self.primeSelect.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        //        [self.tableView setContentOffset:CGPointMake(0, 0)];
        [self.view layoutIfNeeded];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 加载数据
-(void)loadData
{
    //需要展示的数据以数组的形式保存
    self.letter = @[@"aaa",@"bbb",@"ccc",@"ddd"];
  
}

#pragma mark UIPickerView DataSource Method 数据源方法

//指定pickerview有几个表盘
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;//第一个展示字母、第二个展示数字
}

//指定每个表盘上有几行数据
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return self.letter.count;
}

#pragma mark UIPickerView Delegate Method 代理方法

//指定每行如何展示数据（此处和tableview类似）
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString * title = nil;
 
    title = self.letter[row];
   
    
    return title;
}


@end
