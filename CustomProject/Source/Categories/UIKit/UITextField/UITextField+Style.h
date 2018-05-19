//
//  UITextField+Style.h
//  FaceLoan
//
//  Created by mozhu on 16/12/7.
//  Copyright © 2016年 zf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField(style)

/**
 *  全能初始化方法
 *
 *  @param placeHolder  提示文字
 *  @param delegate     代理
 *  @param textColor    字体颜色
 *  @param font         字号大小
 *  @param keyboardType 弹出的键盘类型
 */
+ (UITextField *)textFieldWithBgColor:(UIColor*)bgColor placeHolder:(NSString *)placeHolder delegate:(id)delegate textColor:(UIColor *)textColor font:(UIFont *)font keyboardType:(UIKeyboardType)keyboardType;
/**
 设置 textfield placeHolder 风格
 */
+(UITextField *)textFieldWithBgColor:(UIColor *)bgColor
                         placeHolder:(NSString *)placeHolder
                         placeHolderColor:(UIColor *)placeHolderColor
                         placeHolderFont:(UIFont *)placeHolderFont
                            delegate:(id)delegate
                           textColor:(UIColor *)textColor
                                font:(UIFont *)font ;

@end
