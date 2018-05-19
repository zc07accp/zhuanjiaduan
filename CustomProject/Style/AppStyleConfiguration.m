//
//  AppStyleConfiguration.m
//  FaceLoan
//
//  Created by zf on 2016/12/6.
//  Copyright © 2016年 zf. All rights reserved.
//

#import "AppStyleConfiguration.h"

@implementation AppStyleConfiguration

/**
 *  获取app字体
 *
 *  @param size <#size description#>
 *
 *  @return <#return value description#>
 */
+ (UIFont*)appFont:(NSInteger)size{
    
    return [UIFont systemFontOfSize:size];
}
+(UIColor*)ColorWithBottomTabBarUnSelectColor
{
    return [UIColor colorWithRed:0.67f green:0.67f blue:0.67f alpha:1.00f];
}
+(UIColor *)ColorWithLineColor
{
    return [UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.00f];
}
+(UIColor*)ColorWithBottomTabBarSelectColor
{
  return [UIColor blackColor];
}
+(UIColor*)ColorWithNavigationTitleColor
{
    return [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
}
+(UIColor*)ColorWithNavigationBackgroundColor
{
    return [UIColor colorWithRed:1.00f green:0.43f blue:0.00f alpha:1.00f];
}

/**
 字体白色
 */
+ (UIColor*)ColorWithTextWhite
{
    return [UIColor whiteColor];
}
/**
 字体一级
 */
+ (UIColor*)ColorWithTextOne{
    return [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
}
/**
 字体二级
 */
+ (UIColor*)ColorWithTextTwo{
    return [UIColor colorWithRed:0.46f green:0.46f blue:0.46f alpha:1.00f];
}
/**
 字体三级
 */
+ (UIColor*)ColorWithTextThree{
    return [UIColor colorWithRed:0.58f green:0.58f blue:0.58f alpha:1.00f];
}

/**
 字体大标题
 */
+ (UIFont*)FontWith18{
    return [UIFont systemFontOfSize:18];
}
/**
 字体小标题
 */
+ (UIFont*)FontWith16{
    return [UIFont systemFontOfSize:16];
}

/**
 字体普通字体
 */
+ (UIFont*)FontWith14{
    return [UIFont systemFontOfSize:14];
}
/**
 字体次要字体
 */
+ (UIFont*)FontWith12{
    return [UIFont systemFontOfSize:12];
}
/**
 字体最小字体
 */
+ (UIFont*)FontWith10{
    {
        return [UIFont systemFontOfSize:10];
    }
}
/*
 主题色彩
 **/
+ (UIColor*)ColorWithMain
{
    return [UIColor colorWithRed:0.95 green:0.84 blue:0.30 alpha:1.00];
}
/**
 背景色
 */
+ (UIColor*)ColorWithBaseBoard{
    return [UIColor colorWithRed:0.94f green:0.94f blue:0.96f alpha:1.00f];
}
@end
