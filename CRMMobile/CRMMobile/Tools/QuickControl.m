//
//  QuickControl.m
//  YiLaiFu-AYiDuan
//
//  Created by liujian on 15/11/20.
//  Copyright © 2015年 liujian. All rights reserved.
//

#import "QuickControl.h"

@implementation QuickControl

+ (UIImage *)getImageWithImageName:(NSString *)imageName{

    UIImage *image = [UIImage imageNamed:imageName];
    return image;
}

+ (UIImageView *)createImageViewWithFrame:(CGRect)frame image:(NSString *)image{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    if (image != nil) {
        if ([image rangeOfString:@"http"].location == NSNotFound) {
            imageView.image = [QuickControl getImageWithImageName:image];
        }else{
            [imageView sd_setImageWithURL:[NSURL URLWithString:image] placeholderImage:DEFAULTBACK];
        }
    }else
    {
        imageView.image = [QuickControl getImageWithImageName:image];
    }
    return imageView;
}

+ (UILabel *)createLabelWithFrame:(CGRect)frame backgroundColor:(UIColor *)backColor text:(NSString *)text textColor:(UIColor *)textColor font:(int)font{

    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    if (backColor) {
        label.backgroundColor = backColor;
    }else{
        label.backgroundColor = [UIColor clearColor];
    }
    label.text = text;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:font];
    return label;
}
+ (UILabel *)createCutLineWithFrame:(CGRect)frame backgroundColor:(UIColor *)color{
    
    UILabel *line = [[UILabel alloc] initWithFrame:frame];
    line.backgroundColor = color;
    return line;
}

+ (UIView *)createViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)color{
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    return view;
}

+ (UIButton *)createButtonWithFrame:(CGRect)frame backgroundColor:(UIColor *)backColor title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action{
    
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    button.backgroundColor = backColor;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)createButtonWithFrame:(CGRect)frame backgroundColor:(UIColor *)backColor title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font image:(NSString *)image target:(id)target action:(SEL)action{
    
    UIButton *button = [QuickControl createButtonWithFrame:frame backgroundColor:backColor title:title titleColor:titleColor font:font target:target action:action];
    [button setImage:[QuickControl getImageWithImageName:image] forState:UIControlStateNormal];
//    [button setImageEdgeInsets:imageEdgeInsets];
    return button;
}

+ (UIButton *)createButtonWithFrame:(CGRect)frame backgroundImage:(NSString *)backImage target:(id)target action:(SEL)action{
    
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setBackgroundImage:[QuickControl getImageWithImageName:backImage] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)createButtonWithFrame:(CGRect)frame backgroundImage:(NSString *)backImage title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font target:(id)target action:(SEL)action{
    
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button setBackgroundImage:[QuickControl getImageWithImageName:backImage] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

+ (UIButton *)createButtonImageWithFrame:(CGRect)frame backgroundImage:(NSString *)backImage target:(id)target action:(SEL)action{
    
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    button.backgroundColor = [UIColor clearColor];
    UIImageView *image = [QuickControl createImageViewWithFrame:button.bounds image:backImage];
    image.contentMode = UIViewContentModeCenter;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button addSubview:image];
    return button;
}

+ (UITextField *)createTextFieldWithFrame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)textColor borderStyle:(UITextBorderStyle)borderStyle returnKeyType:(UIReturnKeyType)returnKeyType placeholder:(NSString *)placeholder{
    
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.font = font;
    textField.textColor = textColor;
    textField.borderStyle = borderStyle;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.returnKeyType = returnKeyType;
    textField.placeholder = placeholder;
    return textField;
}
+ (UITextField *)createTextFieldWithFrame1:(CGRect)frame font:(int)font textColor:(UIColor *)textColor borderStyle:(UITextBorderStyle)borderStyle returnKeyType:(UIReturnKeyType)returnKeyType placeholder:(NSString *)placeholder disabledBackground:(NSString *)backImageStr clearButtonMode:(UITextFieldViewMode)clearButtonMode keyboardType:(UIKeyboardType)keyType delegate:(id)Class{
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.font = [UIFont systemFontOfSize:font];
    textField.textColor = textColor;
    textField.borderStyle = borderStyle;
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.autocorrectionType = UITextAutocorrectionTypeNo;
    textField.returnKeyType = returnKeyType;
    textField.placeholder = placeholder;
    textField.disabledBackground = [UIImage imageNamed:backImageStr];
    textField.clearButtonMode =  clearButtonMode;
    textField.delegate = Class;
    textField.keyboardType = keyType;
    return textField;
}

+(void)getLabel:(UILabel *)comboAbstract andSpace:(float)space
{
    comboAbstract.numberOfLines = 0;
    // 调整行间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:comboAbstract.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [comboAbstract.text length])];
    comboAbstract.attributedText = attributedString;
    [comboAbstract sizeToFit];
}

/**
 *  阴影
 */
+(void)getViewShadow:(UIView *)view
{
    // 即阴影颜色值
    view.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    // 即阴影相对于Y轴有1个像素点的向下位移。
    view.layer.shadowOffset = CGSizeMake(0, 1);
    // 阴影的模糊度
    view.layer.shadowRadius = 1.0f;
    //设置阴影的不透明度
    view.layer.shadowOpacity = 0.3f;
    view.layer.masksToBounds = NO;
    //        //设置缓存 仅复用时设置此项
    //        self.layer.shouldRasterize=YES;
    //        //设置抗锯齿边缘
    //        self.layer.rasterizationScale=[UIScreen mainScreen].scale;
    // 阴影的位置
    //        self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.contentView.layer.cornerRadius].CGPath;
}
/**
 *  获取贴边距lable尺寸
 */
+(CGSize)getSizeLabel:(UILabel*)lable andFont:(CGFloat)lableFont and_X:(CGFloat)lableX{
    // 文字
    lable.numberOfLines = 0;
    lable.lineBreakMode = NSLineBreakByWordWrapping;
    lable.font = [UIFont systemFontOfSize:lableFont];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:lable.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:4];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, lable.text.length)];
    lable.attributedText = attributedString;
    //调节高度
    CGSize size = CGSizeMake(SCREEN_WIDTH - lableX -10, MAXFLOAT);
    CGSize labelSize = [lable sizeThatFits:size];
    return labelSize;
}
/**
 *  获取lable正常尺寸
 */
+(CGSize)get_SizeLabel:(NSString*)text andFont:(CGFloat)lableFont and_W:(CGFloat)textW{
  CGSize retweetContentSize = [text boundingRectWithSize:CGSizeMake(textW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: FONT(lableFont)} context:nil].size;
    return retweetContentSize;
}


/**
 *  获取不同颜色
 */
+(UILabel *)getLabel:(UILabel *)labelStr rangStr:(NSString *)rangStr
{
    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:labelStr.text];
    NSRange redRange = NSMakeRange(0, [[noteStr string] rangeOfString:rangStr].location+1);
    [noteStr addAttribute:NSForegroundColorAttributeName value:colorOf_GrayA range:redRange];
    [labelStr setAttributedText:noteStr] ;
    return labelStr;
}

// 获取不同颜色大小的富文本

+(NSMutableAttributedString *)getStr:(NSString *)title type:(NSString *)type {
    NSMutableAttributedString *titleStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ (%@类)",title,type]];
    
    [titleStr addAttributes:@{NSFontAttributeName:FONT(15),NSForegroundColorAttributeName:colorOf_GrayA
                              } range:NSMakeRange(0, titleStr.length - 5)];
    [titleStr addAttributes:@{NSFontAttributeName:FONT(12),NSForegroundColorAttributeName:colorOf_GrayC
                              } range:NSMakeRange(titleStr.length - 5,5 )];
    return titleStr;
}


+ (void)registerNib:(UITableView *)tableView idStr:(NSString *)str {
    UINib *nib = [UINib nibWithNibName:str bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:str];
}


@end
