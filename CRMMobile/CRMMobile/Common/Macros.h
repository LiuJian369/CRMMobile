//
//  Macros.h
//  SilkRoadItFin
//
//  Created by dagong on 2017/4/6.
//  Copyright © 2017年 dagong. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define STOREAPPID @"1202083002"


#define APPDELEGATE  ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6_6s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6plus_6splus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define StatusBarHeight        (20.f)
#define TopBarHeight           (44.f)
#define NavgationHeight        (StatusBarHeight+TopBarHeight)
#define BottomBarHeight        (49.f)
#define CellDefaultHeight      (44.f)
#define EnglishKeyboardHeight  (216.f)
#define ChineseKeyboardHeight  (252.f)

/// 适配各种屏幕比例.
#define kScreenNewScaleWidth            [UIScreen mainScreen].bounds.size.width/375.0
#define kScreenNewScaleHeight           ([UIScreen mainScreen].bounds.size.height/667.0==1 ? \
1 : [UIScreen mainScreen].bounds.size.height/667.0)
#define kFitWidth_6(a)                  ((a) * (kScreenNewScaleWidth))
#define kFitHeight_6(a)                 ((a) * (kScreenNewScaleHeight))
//不同设备的屏幕比例(当然倍数可以自己控制)
#define pSizeScale (([UIScreen mainScreen].bounds.size.height > 568) ? [UIScreen mainScreen].bounds.size.height/568 : 1)

// View 坐标(x,y)和宽高(width,height)
#define X(v)                    (v).frame.origin.x
#define Y(v)                    (v).frame.origin.y

#define WIDTH(v)                (v).frame.size.width
#define HEIGHT(v)               (v).frame.size.height

#define MinX(v)                 CGRectGetMinX((v).frame)
#define MinY(v)                 CGRectGetMinY((v).frame)

#define MidX(v)                 CGRectGetMidX((v).frame)
#define MidY(v)                 CGRectGetMidY((v).frame)

#define MaxX(v)                 CGRectGetMaxX((v).frame)
#define MaxY(v)                 CGRectGetMaxY((v).frame)

//颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
#define Base_Color RGB(49, 121, 207)
#define gray_Color RGB(230, 230, 230)
#define shadow_Color RGB(156, 198, 248)
#define lightgray_Color RGB(238, 239, 240)
#define mark_Color RGB(236, 223, 199)
// 深深深灰色  ---菜单栏，标题文字，重点突出文字
#define colorOf_GrayA         [UIColor colorWithRed:50./255 green:50./255 blue:50./255 alpha:1.0]
// 深深灰色    ---文字，内容文字
#define colorOf_GrayB         [UIColor colorWithRed:102./255 green:102./255 blue:102./255 alpha:1.0]
// 浅灰色      ---提示文字、时间文字
#define colorOf_GrayC         [UIColor colorWithRed:153./255 green:153./255 blue:153./255 alpha:1.0]
// 浅浅灰色    ---分割线颜色
#define colorOf_GrayD         [UIColor colorWithRed:204./255 green:204./255 blue:204./255 alpha:1.0]
// 浅浅浅灰色  ---背景色、输入框背景色
#define colorOf_GrayE         [UIColor colorWithRed:245./255 green:245./255 blue:245./255 alpha:1.0]

#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]



//中文字体
#define CHINESE_FONT_NAME  @"Heiti SC"
#define CHINESE_SYSTEM(x) [UIFont fontWithName:CHINESE_FONT_NAME size:x]

#define FONT(size) [UIFont systemFontOfSize:size]
#define selfont1 isGTPhone5?18:16  // 1级字体大小     导航栏标题字体
#define selfont2 isGTPhone5?15:14  // 2级字体大小     内容文字
#define selfont3_5 isGTPhone5?14:13// 3.5级字体大小   列表内容文字
#define selfont3 isGTPhone5?12:11  // 3级字体大小
#define selfont4 isGTPhone5?11:10  // 4级字体大小

//字符串不为空
#define IS_NOT_EMPTY(string) (string !=nil && [string isKindOfClass:[NSString class]] && ![string isEqualToString:@""])
//字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
//数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)

//获取图片资源
#define lGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

//获取系统版本
#define IOS_VERSION ［[UIDevice currentDevice] systemVersion] floatValue]
//App版本号
#define appMPVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

#ifdef DEBUG
#define LLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define LLog(...)
#endif

//提示框
#define SHOW_ALERT(_msg_)  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:_msg_ delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];\
[alert show];

// 网络异常,请检查网络!!!
#define webNotion      @"网络异常,请检查网络!!!"
// 默认网络图片背景_方的
#define DEFAULTBACK    [UIImage imageNamed:@"gwc"]
// 默认网络图片背景_轮播图
#define DEFAULTBANNER  [UIImage imageNamed:@"banner"]


//Library/Caches 文件路径
#define FilePath ([[NSFileManager defaultManager] URLForDirectory:NSCachesDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil])
//获取temp
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]


//历史搜索记录的文件路径
#define SearchHistoryPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"hisDatas.plist"]

#define SearchNewsHistoryPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"newsDatas.plist"]

#endif /* Macros_h */
