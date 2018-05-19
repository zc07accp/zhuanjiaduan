//
//  MBProgressHUD+PJH.h
//  CustomProject
//
//  Created by mozhu on 17/11/9.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

/**
 MBProgressHUD 的二次封装
 */
@interface MBProgressHUD (PJH)


#pragma mark-------------------- show messgae----------------------------
+ (void)showTipMessage:(NSString*)message;



#pragma mark-------------------- show Activity----------------------------
+ (void)showActivityMessage:(NSString*)message;

+ (void)showActivityMessage:(NSString*)message timer:(float)aTimer;


#pragma mark-------------------- show Image----------------------------
+ (void)showSuccessMessage:(NSString *)Message;
+ (void)showErrorMessage:(NSString *)Message;
+ (void)showInfoMessage:(NSString *)Message;
+ (void)showWarnMessage:(NSString *)Message;



+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message;


+ (void)hideHUD;

//顶部弹出提示
+ (void)showTopTipMessage:(NSString *)msg;
+ (void)showTopTipMessage:(NSString *)msg isWindow:(BOOL) isWindow;
@end
