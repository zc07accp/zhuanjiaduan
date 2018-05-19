//
//  MBProgressHUD+PJH.m
//  CustomProject
//
//  Created by mozhu on 17/11/9.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "MBProgressHUD+PJH.h"
#import <YYLabel.h>
const NSInteger hideTime = 2;

const CGFloat hudWidth = 90.0f;

@implementation MBProgressHUD (PJH)

+ (MBProgressHUD*)createMBProgressHUDviewWithMessage:(NSString*)message
{
    UIView  *view =  (UIView*)[UIApplication sharedApplication].delegate.window;
    MBProgressHUD * hud = [MBProgressHUD HUDForView:view];
    if (!hud) {
        hud =[MBProgressHUD showHUDAddedTo:view animated:YES];
    }else{
        [hud showAnimated:YES];
    }
    hud.userInteractionEnabled=NO;
    hud.label.text=message?message:@"加载中...";
    hud.label.font=[UIFont systemFontOfSize:15];
    hud.label.textColor= [UIColor whiteColor];
    hud.label.numberOfLines = 0;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor colorWithWhite:0 alpha:0.9];
    hud.removeFromSuperViewOnHide = YES;
    [hud setContentColor:[UIColor whiteColor]];
//    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
//    hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:0.1f];
    return hud;
}
#pragma mark-------------------- show Tip----------------------------

+ (void)showTipMessage:(NSString*)message 
{
    MBProgressHUD *hud = [self createMBProgressHUDviewWithMessage:message ];
    hud.mode = MBProgressHUDModeText;
    hud.minSize=CGSizeZero;
    hud.margin = 13.0f;
    [hud hideAnimated:YES afterDelay:MAX((CGFloat)message.length * 0.06 + 1, hideTime)];
}

#pragma mark-------------------- show Activity----------------------------

+ (void)showActivityMessage:(NSString*)message
{
    [self showActivityMessage:message  timer:0];
}


+ (void)showActivityMessage:(NSString*)message  timer:(float)aTimer
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message ];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.minSize = CGSizeMake(hudWidth, hudWidth);
    if (aTimer>0) {
        [hud hideAnimated:YES afterDelay:aTimer];
    }
}
#pragma mark-------------------- show Image----------------------------

+ (void)showSuccessMessage:(NSString *)Message
{
    [self showCustomIcon:@"MBHUD_Success" message:Message];
}
+ (void)showErrorMessage:(NSString *)Message
{
    [self showCustomIcon:@"MBHUD_Error" message:Message];
}
+ (void)showInfoMessage:(NSString *)Message
{
    [self showCustomIcon:@"MBHUD_Info" message:Message];
}
+ (void)showWarnMessage:(NSString *)Message
{
    [self showCustomIcon:@"MBHUD_Warn" message:Message];
}
+ (void)showCustomIcon:(NSString *)iconName message:(NSString *)message
{
    MBProgressHUD *hud  =  [self createMBProgressHUDviewWithMessage:message ];
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:iconName]];
    hud.minSize = CGSizeMake(hudWidth, hudWidth);
    hud.mode = MBProgressHUDModeCustomView;
    [hud hideAnimated:YES afterDelay:MAX((CGFloat)message.length * 0.06 + 0.5, hideTime)];
}
+ (void)hideHUD
{
    UIView  *winView =(UIView*)[UIApplication sharedApplication].delegate.window;
    
    [self hideAllHUDsForView:winView animated:YES];
}

#pragma mark ————— 顶部tip —————
+ (void)showTopTipMessage:(NSString *)msg {
    [self showTopTipMessage:msg isWindow:NO];
}
+ (void)showTopTipMessage:(NSString *)msg isWindow:(BOOL) isWindow{
    CGFloat padding = 10;
    
    YYLabel *label = [YYLabel new];
    label.text = msg;
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0.033 green:0.685 blue:0.978 alpha:0.9];
    label.width = kMainScreen_width;
    label.textContainerInset = UIEdgeInsetsMake(kMainTopHeight-54, padding, padding, padding);
    
    if (isWindow) {
        label.height = kMainTopHeight;
        label.bottom = 0;
        [kAppWindow addSubview:label];
        
        [UIView animateWithDuration:0.3 animations:^{
            label.top = 0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                label.bottom = 0;
            } completion:^(BOOL finished) {
                [label removeFromSuperview];
            }];
        }];
        
    }else{
        label.height = [MyControl heightForString:label.text CGSizeMake:kMainScreen_width font:16] + 2 * padding;
        label.bottom = (kMainTopHeight );
        [[kAppDelegate getCurrentUIVC].view addSubview:label];
        
        [UIView animateWithDuration:0.3 animations:^{
            label.top = ( kMainTopHeight );
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                label.bottom = (kMainTopHeight );
            } completion:^(BOOL finished) {
                [label removeFromSuperview];
            }];
        }];

    }
    
}
@end
