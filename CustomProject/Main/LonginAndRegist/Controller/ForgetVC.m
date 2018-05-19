//
//  ForgetVC.m
//  CustomProject
//
//  Created by 方涛 on 2017/5/11.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "ForgetVC.h"
#import "LoginView.h"
#import "LoginUtils.h"
#import "UIButton+countDown.h"
#import "ForgetTwoVC.h"
@interface ForgetVC ()
@property(nonatomic,strong)ForgetView *forgetV;
@property(nonatomic,strong)LoginUtils *utils;

@end

@implementation ForgetVC
-(LoginUtils *)utils{
    if (!_utils) {
        _utils=[LoginUtils new];
    }
    return _utils;
}
-(ForgetView *)forgetV{
    if (!_forgetV) {
        _forgetV=[[ForgetView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height-kMainTopHeight)];
        [_forgetV.sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_forgetV.codeTF.codeBtn addTarget:self action:@selector(codeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
     }
    return _forgetV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"忘记密码"];
    [self.view addSubview: self.forgetV];
}
-(void)codeBtnClick:(UIButton*)sender{
    if (![MyControl validateMobile:self.forgetV.phoneTF.tf.text]) {
        [SVProgressHUD showErrorWithStatus:@"手机号码有误"];
        return;
    }
    
    kWeakSelf(self)
    self.utils.cell=self.forgetV.phoneTF.tf.text;
    self.utils.type=@"forgetPass";
    [weakself.forgetV.codeTF.codeBtn showIndicator];
    
    [self.utils sendVerifyCodeSucceed:^(id data) {
        [weakself.forgetV.codeTF.codeBtn hideIndicator];
        if ([data[@"success"] boolValue]) {
            [SVProgressHUD showErrorWithStatus:@"发送成功"];
            [weakself.forgetV.codeTF.codeBtn startTime:60 title:@"重发" waitTittle:@"s"];
        }else{
            [SVProgressHUD showErrorWithStatus:data[@"message"]];
        }
    } failure:^(NSError *error) {
        [weakself.forgetV.codeTF.codeBtn hideIndicator];
    }];
}
-(void)sureBtnClick:(UIButton*)sender
{
    ForgetTwoVC *vc = [ForgetTwoVC new];
    vc.type = @"重置";
    [self.navigationController pushViewController:vc animated:YES];//
    if (self.forgetV.phoneTF.tf.text.length != 11) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确的手机号"];
        return;
    }
    if (self.forgetV.codeTF.tf.text.length<6) {
        [SVProgressHUD showErrorWithStatus:@"验证码不正确"];
        return ;
    }
    if (![MyControl checkPassword:self.forgetV.pwdTF.tf.text]) {
        [SVProgressHUD showErrorWithStatus:@"密码6-15位数字和字母组合"];
        return ;
    }
//    if (![MyControl checkPassword:self.forgetV.pwdTFAgain.tf.text]) {
//        [SVProgressHUD showErrorWithStatus:@"密码6-15位数字和字母组合"];
//        return ;
//    }

    self.utils.cell=self.forgetV.phoneTF.tf.text;
    self.utils.checkCode=self.forgetV.codeTF.tf.text;
    self.utils.passwd=self.forgetV.pwdTF.tf.text;
    self.utils.repasswd=self.forgetV.pwdTFAgain.tf.text;
    if (![self.utils.passwd isEqualToString:self.utils.repasswd]) {
        [SVProgressHUD showErrorWithStatus:@"两次输入的密码不一样"];
        return;
    }
    [sender showIndicator];

    [self.utils loginPwdSet3Succeed:^(id data) {
        if ([data[@"success"]boolValue ]) {
            NSArray *arr=@[self.utils.cell,self.utils.passwd];
            self.pBlock(arr);
     


               [self.navigationController pushViewController:vc animated:YES];//

        }else{
            [SVProgressHUD showErrorWithStatus:data[@"message"]];
        }
        [sender hideIndicator];
    } failure:^(NSError *error) {
        [sender hideIndicator];
    }];
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
