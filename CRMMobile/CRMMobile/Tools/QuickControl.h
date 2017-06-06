//
//  QuickControl.h
//  YiLaiFu-AYiDuan
//
//  Created by liujian on 15/11/20.
//  Copyright © 2015年 liujian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QuickControl : NSObject


+ (UIImage *)getImageWithImageName:(NSString *)imageName;
//创建UIImageView
+ (UIImageView *)createImageViewWithFrame:(CGRect)frame image:(NSString *)image;
//创建UILabel
+ (UILabel *)createLabelWithFrame:(CGRect)frame backgroundColor:(UIColor *)backColor text:(NSString *)text textColor:(UIColor *)textColor font:(int)font;
//创建分割线
+ (UILabel *)createCutLineWithFrame:(CGRect)frame backgroundColor:(UIColor *)color;
//创建UIView
+ (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)color;
//创建UIButton
+ (UIButton *)createButtonWithFrame:(CGRect)frame backgroundColor:(UIColor *)backColor title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action;

+ (UIButton *)createButtonWithFrame:(CGRect)frame backgroundColor:(UIColor *)backColor title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font image:(NSString *)image target:(id)target action:(SEL)action;

+ (UIButton *)createButtonWithFrame:(CGRect)frame backgroundImage:(NSString *)backImage target:(id)target action:(SEL)action;

+ (UIButton *)createButtonImageWithFrame:(CGRect)frame backgroundImage:(NSString *)backImage target:(id)target action:(SEL)action;

+ (UIButton *)createButtonWithFrame:(CGRect)frame backgroundImage:(NSString *)backImage title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action;

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)textColor borderStyle:(UITextBorderStyle)borderStyle returnKeyType:(UIReturnKeyType)returnKeyType placeholder:(NSString *)placeholder;

+ (UITextField *)createTextFieldWithFrame1:(CGRect)frame font:(int)font textColor:(UIColor *)textColor borderStyle:(UITextBorderStyle)borderStyle returnKeyType:(UIReturnKeyType)returnKeyType placeholder:(NSString *)placeholder disabledBackground:(NSString *)backImageStr clearButtonMode:(UITextFieldViewMode)clearButtonMode keyboardType:(UIKeyboardType)keyType delegate:(id)Class;

+(void)getLabel:(UILabel *)comboAbstract andSpace:(float)space;

+(void)getViewShadow:(UIView *)view;

/**
 *  贴边lable的尺寸
 */
+(CGSize)getSizeLabel:(UILabel*)lable andFont:(CGFloat)lableFont and_X:(CGFloat)lableX;
/**
 *  正常的尺寸
 */
+(CGSize)get_SizeLabel:(NSString*)text andFont:(CGFloat)lableFont and_W:(CGFloat)textW;


+(UILabel *)getLabel:(UILabel *)labelStr rangStr:(NSString *)rangStr;

+(void) registerNib:(UITableView *)tableView idStr:(NSString *) str;

+(NSMutableAttributedString *)getStr:(NSString *)title type:(NSString *)type;

@end
