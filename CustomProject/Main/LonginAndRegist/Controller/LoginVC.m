
//
//  LoginVC.m
//  CustomProject
//
//  Created by 方涛 on 2017/5/10.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "LoginVC.h"
#import "LoginView.h"
#import "RegistVC.h"
#import "ForgetVC.h"
#import "LoginUtils.h"
#import "HomeVC.h"
//#import <GTSDK/GeTuiSdk.h>     // GetuiSdk头文件应用//
@interface LoginVC ()
@property(nonatomic,strong)LoginView *loginV;
@property(nonatomic,strong)LoginUtils *utils;

@end

@implementation LoginVC
-(LoginUtils *)utils{
    if (!_utils) {
        _utils=[LoginUtils new];
    }
    return _utils;
}
-(LoginView *)loginV{
    if (!_loginV) {
        _loginV=[[LoginView alloc]initWithFrame:self.view.frame];
        kWeakSelf(self)
        [_loginV.registBtn addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [weakself.navigationController pushViewController:[RegistVC new] animated:YES];
        }];
        //忘记密码
        [_loginV.forgetBtn addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            ForgetVC *vc=[ForgetVC new];
            vc.pBlock=^(NSArray *arr){
                weakself.loginV.userNameTF.tf.text=arr[0];
                weakself.loginV.passWordTF.tf.text=arr[1];
            };
               [weakself.navigationController pushViewController:vc animated:YES];
        }];
        [_loginV.loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _loginV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"登录";
    [self.view addSubview: self.loginV];
    [self AddBtn];

}

-(void)loginBtnClick:(UIButton*)sender
{
    self.utils.cell=self.loginV.userNameTF.tf.text;
    self.utils.loginPwd=self.loginV.passWordTF.tf.text;

    if (!self.utils.cell.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
    }
    if (!self.utils.loginPwd.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
    }
    if (![MyControl validateMobile:self.utils.cell]) {
        [SVProgressHUD showErrorWithStatus:@"手机号输入有误"];
        return;
    }

    [sender showIndicator];
    /**
    登录请求
    */
    [self.utils loginSucceed:^(id data) {
        if ([data[@"success"]integerValue ]==1) {

            [MyControl setObject:self.loginV.userNameTF.tf.text key:K_CELL];
            [MyControl setObject:data[@"userId"] key:K_USERID];
            [MyControl setObject:[MyControl nullDic:data] key:USERDATA];
            if ([MyControl getObjectForKey:K_USERID])
            {

//                [GeTuiSdk bindAlias:[MyControl getObjectForKey:K_USERID] andSequenceNum:[MyControl getObjectForKey:K_USERID]];//绑定别名
            }
            
            [self dismissViewControllerAnimated:YES completion:nil];
            [self.navigationController popViewControllerAnimated:YES];

        }else{
            [SVProgressHUD showErrorWithStatus:data[@"message"]];
        }
        [sender hideIndicator];

    } failure:^(NSError *error) {
        [sender hideIndicator];
    }];
}
-(void)AddBtn{
    kWeakSelf(self)
    self.navLeftBtn=[UIButton buttonWithFrame:CGRectMake(10, kMainTopHeight-44, 30, 40) withTitle:@"" withTitleColor:nil withSize:15 withImageName:@"icon_fanhui_dl" withBGColor:nil];
    [self.navLeftBtn addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
        [weakself dismissViewControllerAnimated:YES completion:nil];
        [weakself.navigationController popViewControllerAnimated:YES];
    }];
    
    [self.view addSubview:self.navLeftBtn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
