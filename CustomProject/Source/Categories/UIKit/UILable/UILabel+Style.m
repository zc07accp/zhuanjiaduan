//
//  UILabel+Style.m
//  InvestApp
//
//  Created by ZhangJiuCheng on 16/3/17.
//  Copyright © 2016年 Zhangjc. All rights reserved.
//

#import "UILabel+Style.h"

@implementation UILabel (style)
/**
 *  获取一个新创建的label
 *
 *  @param color <#color description#>
 */

+ (UILabel*)labelWithSize:(UIFont*)font
                withColor:(UIColor*)color
                 withText:(NSString*)text
{
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = color;
    label.text = text;
    return label;
}

+ (UILabel*)labelWithframe:(CGRect )frame withSize:(NSInteger)size
                 withColor:(UIColor*)color
                  withText:(NSString*)text
{
    UILabel *label = [[UILabel alloc] init];
    label.font = [AppStyleConfiguration appFont:size];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = color;
    label.text = text;
    label.frame=frame;
    return label;
}
@end
