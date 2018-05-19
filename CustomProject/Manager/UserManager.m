//
//  UserManager.m
//  CustomProject
//
//  Created by mozhu on 2017/11/8.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "UserManager.h"

static NSString *loginOutMsg=@"该账号已在其他设备上登录，请重新登录";

@implementation UserManager
SINGLETON_FOR_CLASS(UserManager)

-(instancetype)init{
    self = [super init];
    if (self) {
        //被踢下线
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onKick)
                                                     name:KNotificationOnKick
                                                   object:nil];
    }
    return self;
}
#pragma mark ————— 被踢下线 —————
-(void)onKick{
    
     [self logout:nil];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:loginOutMsg preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction*alertActionConfirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [[kAppDelegate getCurrentUIVC].navigationController popToRootViewControllerAnimated:NO];
        
        
    }];
    
    [alert addAction:alertActionConfirm];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[kAppDelegate getCurrentUIVC] presentViewController:alert animated:YES completion:nil];
    });
   
}
#pragma mark ————— 退出登录 —————
- (void)logout:(void (^)(BOOL, NSString *))completion{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    
//    [[UIApplication sharedApplication] unregisterForRemoteNotifications];
    
    //    [[NSNotificationCenter defaultCenter] postNotificationName:KNotificationLogout object:nil];//被踢下线通知用户退出直播间
    
//    [[IMManager sharedIMManager] IMLogout];
    
    self.curUserInfo = nil;
    self.isLogined = NO;
    
    //    //移除缓存
    [MyControl removeObjectForKey:KUserModelCache];
    
    KPostNotification(KNotificationLoginStateChange, @NO);
}
#pragma mark ————— 加载缓存的用户信息 —————
-(BOOL)loadUserInfo{
    
    NSDictionary * userDic = (NSDictionary *)[MyControl getObjectForKey: KUserModelCache];
    if (userDic) {
        self.curUserInfo = [LoginModel mj_objectWithKeyValues:userDic];
        return YES;
    }
    return NO;
}
/**
 *  获取用户信息
 */

+(LoginModel*)userModel
{
    return  [LoginModel mj_objectWithKeyValues:[MyControl getObjectForKey:KUserModelCache]];
}
#pragma mark ————— 检测是否在线 —————
+(BOOL)online
{
    if ([UserManager userModel].cell.length) {
        return YES;
    }
    return NO;
}
@end
