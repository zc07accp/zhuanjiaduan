//
//  AppDelegate+AppService.h
//  CustomProject
//
//  Created by mozhu on 2017/11/8.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (AppService)
//初始化服务
-(void)initService;

//初始化 window
-(void)initWindow;

//初始化 UMeng
-(void)initUMeng;

//初始化用户系统
-(void)initUserManager;

//自定义界面样式
-(void)customizeInterface;

//监听网络状态
- (void)monitorNetworkStatus;

//定位
- (void)startLocation;

//键盘
-(void)configureBoardManager;

//统一处理一些为数组、集合等对nil插入会引起闪退
-(void)safeCategory;

//单例
+ (AppDelegate *)shareAppDelegate;

/**
 当前顶层控制器
 */
-(UIViewController*) getCurrentVC;

-(UIViewController*) getCurrentUIVC;
@end
