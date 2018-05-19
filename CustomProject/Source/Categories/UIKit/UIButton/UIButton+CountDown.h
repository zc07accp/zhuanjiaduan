//
//  UIButton+countDown.h
//  NetworkEgOc
//
//  Created by iosdev on 15/3/17.
//  Copyright (c) 2015年 iosdev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CountDown)
-(void)startTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle;

- (void)stopTime;

/**
设置开始背景色  结束背景色
 */
-(void)FTstartTime:(NSInteger )timeout title:(NSString *)tittle waitTittle:(NSString *)waitTittle enableColor:(UIColor *)enableColor startColor:(UIColor*)startColor;
/**
 设置开始背景色  结束背景色 等待按钮字体颜色  结束后按钮字颜色
 */
-(void)DaiJiShiStartTime:(NSInteger )timeout title:(NSString *)tittle TitleColor:(UIColor*)titleColor waitTittle:(NSString *)waitTittle WaitTittleColor:(UIColor*)waitTittleColor enableColor:(UIColor *)enableColor startColor:(UIColor*)startColor;
@end
