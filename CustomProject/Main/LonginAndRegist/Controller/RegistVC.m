
//
//  RegistVC.m
//  CustomProject
//
//  Created by 方涛 on 2017/5/10.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "RegistVC.h"
#import "LoginView.h"
#import "LoginUtils.h"
#import "UIButton+countDown.h"
#import "HomeVC.h"
#import "HtmlVC.h"
#import "ForgetTwoVC.h"
@interface RegistVC ()
@property(nonatomic,strong)RegistView *registV;
@property(nonatomic,strong)LoginUtils *utils;
@property(nonatomic,strong)NSString *url;
@end

@implementation RegistVC
-(LoginUtils *)utils{
    if (!_utils) {
        _utils=[LoginUtils new];
    }
    return _utils;
}
-(RegistView *)registV{
    if (!_registV) {
        kWeakSelf(self)
        _registV=[[RegistView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height-kMainTopHeight)];
        //验证码
        [_registV.codeTF.codeBtn addTarget:self action:@selector(codeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_registV.sureBtn addTarget:self action:@selector(nextBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_registV.zhuCeXieYiLab1 addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            HtmlVC *vc=[HtmlVC new];
            vc.titleStr=@"用户注册协议";
            [weakself.navigationController pushViewController:vc animated:YES];
        }];
        
//        [_registV.sureBtn addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
//            [MyControl SVProgressHUDWithStr:@"注册成功" Image:@"icon_wancheng"];
//        }];
    }
    return _registV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"注册"];
    [self.view addSubview: self.registV];
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self.registV.codeTF.codeBtn stopTime];
}

//验证码
-(void)codeBtnClick:(UIButton*)sender{
    if (self.registV.phoneTF.tf.text.length<11) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确的手机号"];
        return;
    }
    [self.registV.codeTF.codeBtn showIndicator];
    self.utils.cell=self.registV.phoneTF.tf.text;
    self.utils.type=@"regist";
    
    [self.utils sendVerifyCodeSucceed:^(id data)
    {
        [self.registV.codeTF.codeBtn hideIndicator];

        if ([data[@"success"]integerValue]==1)
        {
            [SVProgressHUD showErrorWithStatus:@"发送成功"];
            [self.registV.codeTF.codeBtn startTime:59 title:@"重新发送" waitTittle:@"s"];
        }else{
            [SVProgressHUD showErrorWithStatus:data[@"message"]];
        }
        
    } failure:^(NSError *error) {
        [self.registV.codeTF.codeBtn hideIndicator];
    }];
}
/**
 下一步按钮
 */
-(void)nextBtnClick:(UIButton*)sender{
    
    if (self.registV.phoneTF.tf.text.length != 11) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确的手机号"];
        return;
    }
    
    if (self.registV.codeTF.tf.text.length<6) {
        [SVProgressHUD showErrorWithStatus:@"验证码不正确"];
        return ;
    }

    self.utils.cell=self.registV.phoneTF.tf.text;
    self.utils.checkCode=self.registV.codeTF.tf.text;


    [sender showIndicator];


    ForgetTwoVC * vc = [ForgetTwoVC new];

    vc.type = @"注册";
    [self.navigationController pushViewController:vc animated:YES];
//    [self.utils loginPwdSet1Succeed:^(id data) {
//        if ([data[@"success"]integerValue]==1) {
//            [MyControl setObject:self.registV.phoneTF.tf.text key:K_CELL];
//            [MyControl setObject:data[@"userId"] key:K_USERID];
//            [MyControl setObject:[MyControl nullDic:data] key:USERDATA];
//            [SVProgressHUD showErrorWithStatus:@"注册成功"];
//            [self dismissViewControllerAnimated:YES completion:nil];
//            [self.navigationController popToRootViewControllerAnimated:YES];
//        }else{
//            [SVProgressHUD showErrorWithStatus:data[@"message"]];
//        }
//        [sender hideIndicator];
//
//    } failure:^(NSError *error) {
//        [sender hideIndicator];
//
//    }];
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
