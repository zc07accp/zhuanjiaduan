
//
//  LoginUtils.m
//  CustomProject
//
//  Created by 方涛 on 2017/5/22.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "LoginUtils.h"

@implementation LoginUtils
//登录 userLoginSX.do
-(void)loginSucceed:(sudcceed)sc failure:(failure)fai{
    NSMutableDictionary *dic=[self getBaseParameter];
    [dic setValue:self.cell forKey:@"cell"];
    [dic setValue:[ZFdes encrypt:self.loginPwd] forKey:@"loginPwd"];
    [self requestData:dic method:@"userLoginSX.do" succeed:^(id response) {
        if ([response[@"success"] integerValue]==1) {
            sc(response);
        }else{
            [SVProgressHUD showErrorWithStatus:response[@"message"]];
            
            fai(nil);
        }
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        fai(nil);
        
    }];
    
}
////注册
//-(void)registSucceed:(sudcceed)sc failure:(failure)fai{
//    NSMutableDictionary *dic=[self getBaseParameter];
//    [dic setValue:self.cell forKey:@"cell"];
//    [dic setValue:self.checkCode forKey:@"checkCode"];
//    [self requestData:dic method:@"userLogin.do" succeed:^(id response) {
//        sc(response);
//    } failure:^(NSError *error) {
//        [SVProgressHUD showErrorWithStatus:networkinngError];
//        fai(nil);
//        
//    }];
//}
//校验验证码
-(void)registerVerifyCodeSucceed:(sudcceed)sc failure:(failure)fai{
    NSMutableDictionary *dic=[self getBaseParameter];
    [dic setValue:self.cell forKey:@"cell"];
    [dic setValue:self.checkCode forKey:@"checkCode"];
    [self requestData:dic method:@"checkVerifyCode.do" succeed:^(id response) {
        sc(response);
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        fai(nil);
        
    }];
}
/**
 注册账号
 loginPwdSet.do
 */
-(void)loginPwdSet1Succeed:(sudcceed)sc failure:(failure)fai{
    NSMutableDictionary *dic=[self getBaseParameter];
    //    [dic setValue:@"1" forKey:@"reqType"];
    [dic setValue:[ZFdes encrypt:self.passwd] forKey:@"password"];
//    [dic setValue:[ZFdes encrypt:self.repasswd] forKey:@"repasswd"];
    [dic setValue:self.checkCode forKey:@"checkCode"];
    [dic setValue:self.cell forKey:@"cell"];
    [dic setValue:self.proCell forKey:@"proCell"];
    [self requestData:dic method:@"registerSX.do" succeed:^(id response) {
        sc(response);
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        fai(nil);
        
    }];
}
/**
 绑定新手机
*/
-(void)bangdingxinshouji:(sudcceed)sc failure:(failure)fai
{
    NSMutableDictionary *dic=[self getBaseParameter];
    [dic setValue:self.checkCode forKey:@"checkCode"];
    [dic setValue:self.cell forKey:@"newCell"];
    [self requestData:dic method:@"bindingCell.do" succeed:^(id response) {
        sc(response);
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        fai(nil);

    }];
}
/**
 sendVerifyCodeSX.do
 验证码
 */
-(void)sendVerifyCodeSucceed:(sudcceed)sc failure:(failure)fai{
    NSMutableDictionary *dic=[self getBaseParameter];
    [dic setValue:self.cell forKey:@"cell"];
    if (self.type)
    {
        [dic setValue:self.type forKey:@"type"];
    }
    
    [self requestData:dic method:@"sendVerifyCodeSX.do" succeed:^(id response) {
        sc(response);
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        fai(nil);
        
    }];
    
}
/**
 modifyUserLoginPwd.do 修改登录密码 reqType=2
 */
-(void)loginPwdSet2Succeed:(sudcceed)sc failure:(failure)fai{
    NSMutableDictionary *dic=[self getBaseParameter];
    [dic setValue:@"1" forKey:@"reqType"];
    [dic setValue:[ZFdes encrypt:self.passwd] forKey:@"newPwd"];
    [dic setValue:[ZFdes encrypt:self.repasswd] forKey:@"confirmPwd"];
    [dic setValue:[ZFdes encrypt:self.originalPwd] forKey:@"oldPwd"];
    [self requestData:dic method:@"modifyUserLoginPwd.do" succeed:^(id response) {
        sc(response);
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        fai(nil);
        
    }];
    
}
/**
 loginPwdSet.do 忘记密码修改登录密码 reqType=3
 */
-(void)loginPwdSet3Succeed:(sudcceed)sc failure:(failure)fai{
    NSMutableDictionary *dic=[self getBaseParameter];
    [dic setValue:[ZFdes encrypt:self.passwd] forKey:@"newPwd"];
    [dic setValue:[ZFdes encrypt:self.repasswd] forKey:@"confirmPwd"];
    [dic setValue:self.cell forKey:@"cell"];
    [dic setValue:self.checkCode forKey:@"checkCode"];
    [self requestData:dic method:@"forgetUserPwd.do" succeed:^(id response) {
        sc([MyControl nullDic:response]);
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        fai(nil);
        
    }];
    
}

/**
 modifyUserPwd.do  支付密码设置  修改
 */
-(void)payPwdSetSucceed:(sudcceed)sc failure:(failure)fai
{
    NSMutableDictionary *dic=[self getBaseParameter];
    
    [dic setValue:self.reqType forKey:@"type"];
    [dic setValue:[ZFdes encrypt:self.passwd] forKey:@"newPwd"];
    [dic setValue:[ZFdes encrypt:self.repasswd] forKey:@"confirmPwd"];
    [self requestData:dic method:@"modifyUserPwd.do" succeed:^(id response) {
        sc(response);
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        fai(nil);
        
    }];
}
/**
 forgetPayPwd.do  忘记支付密码
 */
-(void)forgetPayPwdSucceed:(sudcceed)sc failure:(failure)fai
{
    NSMutableDictionary *dic=[self getBaseParameter];
    
    [dic setValue:self.checkCode forKey:@"checkCode"];
    [dic setValue:[ZFdes encrypt:self.passwd] forKey:@"passwd"];
    [dic setValue:[ZFdes encrypt:self.repasswd] forKey:@"rePasswd"];
    [dic setValue:self.cell forKey:@"mobile"];
    
    
    [self requestData:dic method:@"forgetPayPwd.do" succeed:^(id response) {
        sc(response);
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:networkinngError];
        fai(nil);
        
    }];
}
@end
