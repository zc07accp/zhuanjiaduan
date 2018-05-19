//
//  UserManager.h
//  CustomProject
//
//  Created by mozhu on 2017/11/8.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginModel.h"

typedef NS_ENUM(NSInteger, UserLoginType){
    kUserLoginTypeUnKnow = 0,//未知
    kUserLoginTypeWeChat,//微信登录
    kUserLoginTypeQQ,///QQ登录
    kUserLoginTypePwd,///账号登录
};





/**
 包含用户相关服务
 */
@interface UserManager : NSObject


//当前用户
@property (nonatomic, strong) LoginModel *curUserInfo;
@property (nonatomic, assign) UserLoginType loginType;
@property (nonatomic, assign) BOOL isLogined;



//单例
SINGLETON_FOR_HEADER(UserManager)
/**
 加载缓存用户数据
 
 @return 是否成功
 */
-(BOOL)loadUserInfo;

/**
 *  获取用户信息
 */

+(LoginModel*)userModel;
/**
 是否在线
 */
+(BOOL)online;


@end
