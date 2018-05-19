
//  MyControl.h
//  LoL
//
//  Created by LoL on 15/4/12.
//  Copyright (c) 2015年 _LoL_. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SGInfoAlert.h"
typedef void(^sure)(void);
typedef void(^cancel)(void);

@interface MyControl : NSObject

//添加NSUserDefaults
+(void)setObject:(id)object key:(NSString *)key;
//获取NSUserDefaults
+(id)getObjectForKey:(NSString *)key;
//移除NSUserDefaults
+(void)removeObjectForKey:(NSString *)key;


//弹出提示框
+(void)setAlertInfo:(NSString *)info
       andSuperview:(UIView *)view;

//null转化
+(NSDictionary *)nullDic:(NSDictionary *)myDic;

+(id)changeType:(id)myObj;

+(NSArray *)nullArr:(NSArray *)myArr;

+(NSString *)stringToString:(NSString *)string;

+(NSString *)nullToString;

+(void)vc:(id)vc phone:(NSString *)phone;
/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
+(void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

+(void)vc:(id)vc;
/**
 *  根据文字返回高度
 */
+(CGFloat )heightForString:(NSString *)str CGSizeMake:(CGFloat )width font:(CGFloat)font;
/**
 *  根据文字返回size
 */
+ (CGSize)sizeForNoticeTitle:(NSString*)text font:(CGFloat )font;
//手机号验证
+ (BOOL) validateMobile:(NSString *)mobile;
/**
 *富文本
 */
+(void)setTitleStyle:(UILabel *)label title:(NSString *)title content:(NSString *)content foot:(NSString *)foot color: (UIColor *)color  font:(CGFloat)font;

/**
 *模糊
 */
+(void)setBlurEffect:(UIView *)view;

#pragma 正则匹配用户密码6-12位数字和字母组合
+ (BOOL)checkPassword:(NSString *) password;
+ (BOOL)checkIsPassword:(NSString *) password;
#pragma mark  计算缓存大小
+ (float)cacheSize;

#pragma mark  清除缓存
+ (BOOL)removeCache;
// 转换dic成string
+ (NSString*)jsonStringOfObj:(NSDictionary*)dic;

//计算两个日期之间的天数
+ (NSInteger) calcDaysFromBegin:(NSDate *)beginDate end:(NSDate *)endDate;

//判断字符串是否是纯数字
+ (BOOL)validateNumber:(NSString*)number;

//富文本
+(void)setTitleStyle:(UILabel *)label title:(NSString *)title content:(NSString *)content foot:(NSString *)foot Color:(UIColor* )color;

/**
 选择提示框
 */
+(void)chooseViewWithStr:(NSString*)str superView:(UIView*)view sure:(sure)su cancel:(cancel)cel;

/**
 提示框
 */
+(void)TiShiKuangWithTitle:(NSString*)title Str:(NSString*)str;
/**
 带图片，文字的提示框
 */
+(void)TiShiKuangWithString:(NSString*)str Image:(NSString*)Img;

/**
成功提示框1
 */
+(void)SVProgressHUDWithStr:(NSString*)str Image:(NSString*)Img;

/**
 *验证码输入框
 **/
+(void)setCodeTextFieldStyle:(UITextField *)tf;

/**
 *手机号输入框
 **/
+(void)setPhoneTextFieldStyle:(UITextField *)tf;

/**
 *交易密码输入框
 **/
+(void)setPayPwdTextFieldStyle:(UITextField *)tf;

/**
 *密码输入框
 **/
+(void)setPwdTextFieldStyle:(UITextField *)tf;


@end

