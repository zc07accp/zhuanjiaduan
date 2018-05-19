//
//  CommonMacros.h
//  CustomProject
//
//  Created by mozhu on 2017/11/8.
//  Copyright © 2017年 puyue.com. All rights reserved.
//


//全局标记字符串，用于 通知 存储

#ifndef CommonMacros_h
#define CommonMacros_h


#pragma mark - ——————— 用户相关 ————————
//登录状态改变通知
#define KNotificationLoginStateChange @"loginStateChange"

//自动登录成功
#define KNotificationAutoLoginSuccess @"KNotificationAutoLoginSuccess"

//被踢下线
#define KNotificationOnKick @"KNotificationOnKick"

//用户model缓存
#define KUserModelCache @"KUserModelCache"




#define K_CELL @"cell"
#define K_USERID @"userId"
#define USERDATA @"USERDATA"


#pragma mark - ——————— 网络状态相关 ————————

//网络状态变化
#define KNotificationNetWorkStateChange @"KNotificationNetWorkStateChange"


#endif /* CommonMacros_h */
