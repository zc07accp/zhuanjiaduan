//
//  LoginUtils.h
//  CustomProject
//
//  Created by 方涛 on 2017/5/22.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "BaseUtils.h"

@interface LoginUtils : BaseUtils
@property(nonatomic,strong)NSString *cell;
@property(nonatomic,strong)NSString *checkCode;
@property(nonatomic,strong)NSString *loginPwd;
@property(nonatomic,strong)NSString *proCell;//邀请人ID
//登录
-(void)loginSucceed:(sudcceed)sc failure:(failure)fai;

////注册
//-(void)registSucceed:(sudcceed)sc failure:(failure)fai;
//注册校验验证码
-(void)registerVerifyCodeSucceed:(sudcceed)sc failure:(failure)fai;
/**
 loginPwdSet.do  注册完成，设置密码 reqType=1，修改登录密码 reqType=2
 */
@property(nonatomic,strong)NSString *passwd;
@property(nonatomic,strong)NSString *repasswd;

-(void)loginPwdSet1Succeed:(sudcceed)sc failure:(failure)fai;



/**
 绑定新手机
*/

-(void)bangdingxinshouji:(sudcceed)sc failure:(failure)fai;

/**
 sendVerifyCode.do  验证码
 */
@property(nonatomic,strong)NSString *type;
-(void)sendVerifyCodeSucceed:(sudcceed)sc failure:(failure)fai;

/**
 modifyUserLoginPwd.do
 */
@property(nonatomic,strong)NSString *originalPwd;//原登录密码
-(void)loginPwdSet2Succeed:(sudcceed)sc failure:(failure)fai;

/**
 loginPwdSet.do 忘记密码,修改登录密码 reqType=3
 */
-(void)loginPwdSet3Succeed:(sudcceed)sc failure:(failure)fai;

/**
 payPwdSet.do  支付密码设置
 */
@property(nonatomic,strong)NSString *reqType;
-(void)payPwdSetSucceed:(sudcceed)sc failure:(failure)fai;

/**
 forgetPayPwd.do  忘记支付密码
 */
-(void)forgetPayPwdSucceed:(sudcceed)sc failure:(failure)fai;

@end
