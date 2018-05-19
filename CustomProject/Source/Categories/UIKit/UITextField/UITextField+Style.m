//
//  UITextField+Style.m
//  FaceLoan
//
//  Created by mozhu on 16/12/7.
//  Copyright © 2016年 zf. All rights reserved.
//

#import "UITextField+Style.h"

@implementation UITextField(style)


/**
 *  全能初始化方法
 *  @param placeHolder  提示文字
 *  @param delegate     代理
 *  @param textColor    字体颜色
 *  @param font         字号大小
 *  @param keyboardType 弹出的键盘类型
 */
+ (UITextField *)textFieldWithBgColor:(UIColor *)bgColor placeHolder:(NSString *)placeHolder delegate:(id)delegate textColor:(UIColor *)textColor font:(UIFont *)font keyboardType:(UIKeyboardType)keyboardType
{
    UITextField *textField = [[UITextField alloc] init];

    textField.layer.borderColor = [UIColor whiteColor].CGColor;
    textField.layer.borderWidth = 1;
    textField.backgroundColor = bgColor;
    textField.placeholder = placeHolder;
    textField.clearsOnBeginEditing = NO;
    textField.delegate = delegate;
    textField.textColor = textColor;
    textField.font = font;
    textField.keyboardType = keyboardType;
//    [textField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
//    [textField setValue:[UIFont boldSystemFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    return textField;
}
#pragma mark - 禁用所有长按文本框操作
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if ([UIMenuController sharedMenuController]) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    return NO;
}

//- (CGRect)leftViewRectForBounds:(CGRect)bounds
//{
//    CGRect iconRect = [super leftViewRectForBounds:bounds];
//    iconRect.origin.x += 15; //像右边偏15
//    return iconRect;
//}
#pragma clang diagnostic push#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"// your override#pragma clang diagnostic pop
//UITextField 文字与输入框的距离
//- (CGRect)textRectForBounds:(CGRect)bounds{
//
//    return CGRectInset(bounds, 45, 0);
//
//}

//控制文本的位置
//- (CGRect)editingRectForBounds:(CGRect)bounds{
//
//    return CGRectInset(bounds, 45, 0);
//}

+(UITextField *)textFieldWithBgColor:(UIColor *)bgColor
                         placeHolder:(NSString *)placeHolder
                    placeHolderColor:(UIColor *)placeHolderColor
                     placeHolderFont:(UIFont *)placeHolderFont
                            delegate:(id)delegate
                           textColor:(UIColor *)textColor
                                font:(UIFont *)font
{
    UITextField *textField = [[UITextField alloc] init];
    
    textField.backgroundColor = bgColor;
    textField.placeholder = placeHolder;
    textField.clearsOnBeginEditing = YES;
    textField.delegate = delegate;
    textField.textColor = textColor;
    textField.font = font;
    [textField setValue:placeHolderColor forKeyPath:@"_placeholderLabel.textColor"];
    [textField setValue:placeHolderFont forKeyPath:@"_placeholderLabel.font"];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    return textField;
}

@end
