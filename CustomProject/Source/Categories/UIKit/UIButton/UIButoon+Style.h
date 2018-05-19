//
//  UIButoon+Style.h
//  InvestApp
//
//  Created by ZhangJiuCheng on 16/3/17.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+Delay.h"

typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle) {
    MKButtonEdgeInsetsStyleTop, // image在上，label在下
    MKButtonEdgeInsetsStyleLeft, // image在左，label在右
    MKButtonEdgeInsetsStyleBottom, // image在下，label在上
    MKButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (style)
/**
 *  button
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame  withTitle:(NSString*)title withTitleColor:(UIColor*)tcolor  withSize:(CGFloat)size image:(UIImage *)image target:(id)target action:(SEL)action;


/**
 获取一个新创建的button
 */
+ (UIButton*)buttonWithTitle:(NSString*)title
               withImageName:(NSString*)imgname
                 withBGColor:(UIColor*)color
                   Withlayer:(BOOL)islayer;
+ (UIButton*)buttonWithTitle:(NSString*)title
                 withTitleColor:(UIColor*)tcolor
                 withSize:(CGFloat)size
               withImageName:(NSString*)imgname
                 withBGColor:(UIColor*)color;


/**
 *  弧度button，半径为高度一半
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)color cornerRadius:(CGFloat)radius target:(id)target action:(SEL)action;

/**
 获取一个新创建的button,frame
 */
+ (UIButton*)buttonWithFrame:(CGRect)frame withTitle:(NSString*)title
              withTitleColor:(UIColor*)tcolor
                    withSize:(CGFloat)size
               withImageName:(NSString*)imgname
                 withBGColor:(UIColor*)color;
/**

 设置是否禁用
 */
- (void)setDisabled:(BOOL)b;


/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;


@end









