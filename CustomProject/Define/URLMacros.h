//
//  URLMacros.h
//  CustomProject
//
//  Created by mozhu on 2017/11/8.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#ifndef URLMacros_h
#define URLMacros_h


/*
 
 将项目中所有的接口写在这里,方便统一管理,降低耦合
 
 这里通过宏定义来切换你当前的服务器类型,
 将你要切换的服务器类型宏后面置为真(即>0即可),其余为假(置为0)
 如下:现在的状态为测试服务器
 这样做切换方便,不用来回每个网络请求修改请求域名,降低出错事件
 */

#define DevelopSever    0
#define TestSever       0
#define ProductSever    1

#if DevelopSever

/**开发服务器*/
#define REQ_BASE_URL @"http://106.14.249.176:8080/freefront/"

#elif TestSever

/**测试服务器*/
#define REQ_BASE_URL @"http://106.14.249.176:8080/freefront/"

#elif ProductSever

/**生产服务器*/
#define REQ_BASE_URL @"http://106.14.249.176:8080/freefront/"
#endif



#pragma mark - ——————— 用户相关 ————————
//自动登录
#define URL_user_auto_login @"/api/autoLogin"
//登录
#define URL_user_login @"/api/login"
//用户详情
#define URL_user_info_detail @"/api/user/info/detail"
//修改头像
#define URL_user_info_change_photo @"/api/user/info/changephoto"




#endif /* URLMacros_h */
