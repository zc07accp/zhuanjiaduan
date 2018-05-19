//
//  LoginView.m
//  CustomProject
//
//  Created by 方涛 on 2017/5/10.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

-(void)loadViews
{
    self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"icon_beijng"]];
    self.layer.contents = (id)[UIImage imageNamed:@"icon_beijng"].CGImage;
    self.logoV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_wode_shouye_s"]];
    self.bgView=[UIView new];
    self.bgView.backgroundColor=[UIColor whiteColor];
    self.userNameTF=[FTTextFiled new];
    [self.userNameTF creatTextFiledWithImage:@"ico_geren_xinshou"];
    self.userNameTF.tf.placeholder=@"请输入手机号";
    self.userNameTF.line.backgroundColor=[UIColor colorWithRed:0.91 green:0.84 blue:0.35 alpha:1.00];
    self.userNameTF.tf.tintColor=[AppStyleConfiguration ColorWithTextTwo];
    self.userNameTF.tf.textColor=[AppStyleConfiguration ColorWithTextTwo];
    self.userNameTF.backgroundColor=[UIColor clearColor];
    [self.userNameTF phone];
    self.passWordTF=[FTTextFiled new];
    [self.passWordTF creatTextFiledWithImage:@"ico_geren_xinshou"];
    self.passWordTF.tf.placeholder=@"请输入密码";
    self.passWordTF.tf.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passWordTF.line.backgroundColor =[UIColor colorWithRed:0.91 green:0.84 blue:0.35 alpha:1.00];
    self.passWordTF.tf.tintColor=[AppStyleConfiguration ColorWithTextTwo];
    self.passWordTF.tf.textColor=[AppStyleConfiguration ColorWithTextTwo];
    self.passWordTF.backgroundColor=[UIColor clearColor];
    [self.passWordTF pwdTextFiledWithBtnOpenImg:@"ico_geren_xinshou" CloseImg:@"ico_geren_xinshou"];
    self.passWordTF.eyeBtn.hidden=NO;
    self.passWordTF.tf.secureTextEntry=YES;
    self.forgetBtn=[UIButton buttonWithTitle:@"忘记密码" withTitleColor:[AppStyleConfiguration ColorWithTextTwo] withSize:12 withImageName:nil withBGColor:nil];
    
    [self.passWordTF.codeBtn setTitle:@"获取验证码" forState:0];
    self.loginBtn=[UIButton buttonWithTitle:@"登录专家版" withTitleColor:[UIColor blackColor] withSize:14 withImageName:nil withBGColor:[AppStyleConfiguration ColorWithMain]];

    [self addSubview:self.logoV];
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.userNameTF];
    [self.bgView addSubview:self.passWordTF];
    [self addSubview:self.forgetBtn];
    [self addSubview:self.loginBtn];
}
-(void)layoutViews{
    [self.logoV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(@(GTFixHeightFlaot(80)));
        make.height.equalTo(self.logoV.mas_height);
        make.width.equalTo(self.logoV.mas_width);
    }];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.logoV.mas_bottom).offset(20);
        make.centerX.equalTo(@0);
        make.width.equalTo(@(kMainScreen_width));
        make.height.equalTo(@(GTFixHeightFlaot(100)));
    }];
    
    [self.userNameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.centerX.equalTo(@0);
        make.left.equalTo(@(GTFixWidthFlaot(10)));
        make.height.equalTo(@(GTFixHeightFlaot(50)));
     }];
    
    [self.passWordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.userNameTF.mas_bottom);
        make.centerX.equalTo(@0);
        make.left.equalTo(@(GTFixWidthFlaot(10)));
        make.height.equalTo(@(GTFixHeightFlaot(50)));
    }];
    
    [self.forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_bottom).offset(GTFixHeightFlaot(15));
        make.right.equalTo(self.bgView.mas_right);
        make.width.equalTo(@(GTFixWidthFlaot(80)));
        make.height.equalTo(@(GTFixHeightFlaot(20)));
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.forgetBtn.mas_bottom).offset(GTFixHeightFlaot(20));
        make.left.equalTo(self.bgView.mas_left).offset(GTFixWidthFlaot(10));
        make.right.equalTo(self.bgView.mas_right).offset(GTFixWidthFlaot(-10));
        make.height.equalTo(@(GTFixHeightFlaot(40)));
        self.loginBtn.layer.cornerRadius=GTFixHeightFlaot(10);
        self.loginBtn.layer.masksToBounds=YES;
    }];
}

@end
@implementation RegistView
-(void)loadViews{


    self.logoV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_wode_shouye_s"]];

    self.phoneTF=[FTTextFiled new];
    [self.phoneTF creatTextFiledWithImage:@"icon_shouji"];
    self.phoneTF.tf.placeholder=@"请输入您的手机号";
    [self.phoneTF line];
    self.phoneTF.backgroundColor=[UIColor whiteColor];
    self.phoneTF.tf.textColor=[AppStyleConfiguration ColorWithTextOne];
    [self.phoneTF.tf setTintColor:[AppStyleConfiguration ColorWithTextOne]];
    self.phoneTF.tf.clearButtonMode=UITextFieldViewModeUnlessEditing;
    [self.phoneTF phone];
    
    self.codeTF=[FTTextFiled new];
    [self.codeTF creatTextFiledWithImage:@"icon_yanzhengma"];
    self.codeTF.tf.placeholder=@"请填写验证码";
    [self.codeTF line];
    self.codeTF.backgroundColor=[UIColor whiteColor];
    self.codeTF.tf.textColor=[AppStyleConfiguration ColorWithTextOne];
    [self.codeTF.tf setTintColor:[AppStyleConfiguration ColorWithTextOne]];
    [self.codeTF checkCode];

    self.codeTF.codeBtn.backgroundColor=[UIColor clearColor];
    [self.codeTF.codeBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    


    self.sureBtn=[UIButton buttonWithTitle:@"下一步" withImageName:nil withBGColor:[AppStyleConfiguration ColorWithMain] Withlayer:YES];
    
    self.zhuCeXieYiLab1=[UILabel labelWithSize:[AppStyleConfiguration appFont:12] withColor:[AppStyleConfiguration ColorWithTextTwo] withText:@""];
    [MyControl setTitleStyle:self.zhuCeXieYiLab1 title:@"我已阅读并同意" content:@"《零错题APP服务条款》" foot:@"" Color:[AppStyleConfiguration ColorWithMain]];
    self.zhuCeXieYiLab1.userInteractionEnabled=YES;
    [self addSubview:self.logoV];

    [self addSubview:self.phoneTF];
    [self addSubview:self.codeTF];
    [self addSubview: self.sureBtn];
    [self addSubview:self.zhuCeXieYiLab1];
}
-(void)layoutViews{


    [self.logoV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(@(GTFixHeightFlaot(80)));
        make.height.equalTo(self.logoV.mas_height);
        make.width.equalTo(self.logoV.mas_width);
    }];

    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(@(GTFixWidthFlaot(10)));
        make.top.equalTo(self.logoV.mas_bottom).offset(30);
        make.height.equalTo(@(GTFixHeightFlaot(40)));
        make.right.equalTo(@(GTFixWidthFlaot(-10)));
    }];
    [self.codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(@(GTFixWidthFlaot(10)));
        make.top.equalTo(self.phoneTF.mas_bottom).offset(20);
        make.height.equalTo(@(GTFixHeightFlaot(40)));
        make.right.equalTo(@(GTFixWidthFlaot(-10)));
    }];
    

    [self.zhuCeXieYiLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.codeTF.mas_bottom).offset(GTFixHeightFlaot(20));
        make.height.equalTo(self.zhuCeXieYiLab1.mas_height);
        make.width.equalTo(self.zhuCeXieYiLab1.mas_width);
        make.left.equalTo(@(GTFixWidthFlaot(20)));
    }];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.left.equalTo(@(GTFixWidthFlaot(10)));
         make.right.equalTo(@(GTFixWidthFlaot(-10)));
        make.height.equalTo(@(GTFixHeightFlaot(40)));
        make.top.equalTo(self.zhuCeXieYiLab1.mas_bottom).offset(50);
        self.sureBtn.layer.cornerRadius=GTFixHeightFlaot(3);

    }];

 
    
}


@end
@implementation ForgetView
-(void)loadViews{
    
    self.phoneTF=[FTTextFiled new];
    [self.phoneTF creatTextFiledWithImage:@"icon_shouji"];
    self.phoneTF.tf.placeholder=@"请输入您的手机号";
    [self.phoneTF line];
    self.phoneTF.backgroundColor=[UIColor whiteColor];
    self.phoneTF.tf.textColor=[AppStyleConfiguration ColorWithTextOne];
    [self.phoneTF.tf setTintColor:[AppStyleConfiguration ColorWithTextOne]];
    self.phoneTF.tf.clearButtonMode=UITextFieldViewModeUnlessEditing;
    [self.phoneTF phone];
    
    self.codeTF=[FTTextFiled new];
    [self.codeTF creatTextFiledWithImage:@"icon_yanzhengma"];
    self.codeTF.tf.placeholder=@"输入验证码";
    [self.codeTF line];
    self.codeTF.backgroundColor=[UIColor whiteColor];
    self.codeTF.tf.textColor=[AppStyleConfiguration ColorWithTextOne];
    [self.codeTF.tf setTintColor:[AppStyleConfiguration ColorWithTextOne]];
    [self.codeTF checkCode];
    self.codeTF.codeBtn.backgroundColor=[UIColor clearColor];
    [self.codeTF.codeBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
//    self.pwdTF=[FTTextFiled new];
//    [self.pwdTF creatTextFiledWithImage:@"icon_mima"];
//    self.pwdTF.backgroundColor=[UIColor whiteColor];
//    self.pwdTF.tf.textColor=[AppStyleConfiguration ColorWithTextOne];
//    [self.pwdTF.tf setTintColor:[AppStyleConfiguration ColorWithTextOne]];
//    self.pwdTF.tf.clearButtonMode=UITextFieldViewModeUnlessEditing;
//    [self.pwdTF pwdTextFiledWithBtnOpenImg:@"" CloseImg:@""];
//    self.pwdTF.tf.placeholder=@"请输入您的新密码";
//    [self.pwdTF line];
//    self.pwdTF.eyeBtn.hidden=YES;
//    self.pwdTF.tf.secureTextEntry=YES;
//
//
//
//    self.pwdTFAgain=[FTTextFiled new];
//    [self.pwdTFAgain creatTextFiledWithImage:@"icon_yanzheng"];
//    self.pwdTFAgain.backgroundColor=[UIColor whiteColor];
//    self.pwdTFAgain.tf.textColor=[AppStyleConfiguration ColorWithTextOne];
//    [self.pwdTFAgain.tf setTintColor:[AppStyleConfiguration ColorWithTextOne]];
//    self.pwdTFAgain.tf.clearButtonMode=UITextFieldViewModeUnlessEditing;
//    [self.pwdTFAgain line];
//    [self.pwdTFAgain pwdTextFiledWithBtnOpenImg:@"" CloseImg:@""];
//    self.pwdTFAgain.tf.placeholder=@"请再次输入您的新密码";
//    self.pwdTFAgain.eyeBtn.hidden=YES;
//    self.pwdTFAgain.tf.secureTextEntry=YES;

    self.sureBtn=[UIButton buttonWithTitle:@"下一步" withImageName:nil withBGColor:[AppStyleConfiguration ColorWithMain] Withlayer:YES];
    
    
    self.tishiALbel = [UILabel labelWithSize:[UIFont systemFontOfSize:13] withColor:[UIColor lightGrayColor] withText:@"*填写手机号以便我们为您提供更好的服务"];
    [self addSubview:self.tishiALbel];
    [self addSubview:self.phoneTF];
    [self addSubview:self.codeTF];
//    [self addSubview:self.pwdTF];
//    [self addSubview:self.pwdTFAgain];
    [self addSubview: self.sureBtn];
}
-(void)layoutViews{
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(GTFixHeightFlaot(10)));
        make.height.equalTo(@(GTFixHeightFlaot(40)));
        make.left.equalTo(@10);
         make.right.equalTo(@-10);
    }];
    [self.codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(kMainScreen_width));
        make.top.equalTo(@(GTFixHeightFlaot(50)));
        make.height.equalTo(@(GTFixHeightFlaot(40)));
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
    }];
    [self.tishiALbel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(kMainScreen_width));
        make.top.equalTo(self.codeTF.mas_bottom).offset(5);
        make.height.equalTo(@(GTFixHeightFlaot(40)));
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
    }];
//    [self.pwdTFAgain mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.equalTo(@(kMainScreen_width));
//        make.top.equalTo(@(GTFixHeightFlaot(140)));
//        make.height.equalTo(@(GTFixHeightFlaot(40)));
//        make.left.equalTo(@0);
//    }];

    
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
        make.height.equalTo(@(GTFixHeightFlaot(40)));
        make.top.equalTo(@(GTFixHeightFlaot(220)));
        self.sureBtn.layer.cornerRadius=GTFixHeightFlaot(5);
        
    }];
    
    
}


@end


@implementation ForgetTwoView
-(void)loadViews{

    self.pwdTF=[FTTextFiled new];
    [self.pwdTF creatTextFiledWithImage:@"icon_shouji"];
    self.pwdTF.tf.placeholder=@"请输入新密码";
    [self.pwdTF line];
    self.pwdTF.backgroundColor=[UIColor whiteColor];
    self.pwdTF.tf.textColor=[AppStyleConfiguration ColorWithTextOne];
    [self.pwdTF.tf setTintColor:[AppStyleConfiguration ColorWithTextOne]];


    [self.pwdTF  pwdTextFiledWithBtnOpenImg:@"ico_geren_xinshou" CloseImg:@"ico_geren_xinshou"];
    self.pwdTF.tf.clearButtonMode=UITextFieldViewModeUnlessEditing;

    self.pwdTF.eyeBtn.hidden=NO;
    self.pwdTF.tf.secureTextEntry=YES;
    self.pwdTFAgain=[FTTextFiled new];
    [self.pwdTFAgain creatTextFiledWithImage:@"icon_yanzhengma"];
    self.pwdTFAgain.tf.placeholder=@"请确认新密码";
    [self.pwdTFAgain line];

    [self.pwdTFAgain  pwdTextFiledWithBtnOpenImg:@"ico_geren_xinshou" CloseImg:@"ico_geren_xinshou"];
    self.pwdTFAgain.eyeBtn.hidden=NO;
    self.pwdTFAgain.tf.secureTextEntry=YES;
    
    self.pwdTFAgain.backgroundColor=[UIColor whiteColor];
    self.pwdTFAgain.tf.clearButtonMode=UITextFieldViewModeUnlessEditing;
    self.pwdTFAgain.tf.textColor=[AppStyleConfiguration ColorWithTextOne];
    [self.pwdTFAgain.tf setTintColor:[AppStyleConfiguration ColorWithTextOne]];

    self.sureBtn=[UIButton buttonWithTitle:@"完成" withImageName:nil withBGColor:[AppStyleConfiguration ColorWithMain] Withlayer:YES];



    [self addSubview:self.pwdTF];
    [self addSubview:self.pwdTFAgain];

    [self addSubview: self.sureBtn];
}
-(void)layoutViews{
    [self.pwdTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(GTFixHeightFlaot(10)));
        make.height.equalTo(@(GTFixHeightFlaot(40)));
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
    }];
    [self.pwdTFAgain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(kMainScreen_width));
        make.top.equalTo(@(GTFixHeightFlaot(50)));
        make.height.equalTo(@(GTFixHeightFlaot(40)));
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
    }];

    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
        make.height.equalTo(@(GTFixHeightFlaot(40)));
        make.top.equalTo(@(GTFixHeightFlaot(220)));
        self.sureBtn.layer.cornerRadius=GTFixHeightFlaot(5);

    }];


}


@end




@implementation RegistDetailView
- (void)loadViews
{



    self.logoV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_wode_shouye_s"]];
    self.NickTF=[FTTextFiled new];
    [self.NickTF creatTextFiledWithImage:@"icon_shouji"];
    self.NickTF.tf.placeholder=@"请输入昵称";
    [self.NickTF line];
    self.NickTF.backgroundColor=[UIColor whiteColor];
    self.NickTF.tf.textColor=[AppStyleConfiguration ColorWithTextOne];
    [self.NickTF.tf setTintColor:[AppStyleConfiguration ColorWithTextOne]];
    self.NickTF.tf.clearButtonMode=UITextFieldViewModeUnlessEditing;



    self.YearTF=[FTTextFiled new];
    [self.YearTF creatTextFiledWithImage:@"icon_yanzhengma"];
    self.YearTF.tf.placeholder=@"年级";
    [self.YearTF line];
    self.YearTF.backgroundColor=[UIColor whiteColor];
    self.YearTF.tf.textColor=[AppStyleConfiguration ColorWithTextOne];
    [self.YearTF.tf setTintColor:[AppStyleConfiguration ColorWithTextOne]];
    self.YearTF.tf.userInteractionEnabled = NO;


    self.CityTF=[FTTextFiled new];
    [self.CityTF creatTextFiledWithImage:@"icon_yanzhengma"];
    self.CityTF.tf.placeholder=@"城市";
    [self.CityTF line];
    self.CityTF.backgroundColor=[UIColor whiteColor];
    self.CityTF.tf.textColor=[AppStyleConfiguration ColorWithTextOne];
    [self.CityTF.tf setTintColor:[AppStyleConfiguration ColorWithTextOne]];
    self.CityTF.tf.userInteractionEnabled = NO;

    self.sureBtn=[UIButton buttonWithTitle:@"完成" withImageName:nil withBGColor:[AppStyleConfiguration ColorWithMain] Withlayer:YES];



    [self addSubview:self.logoV];
    [self addSubview:self. NickTF];
    [self addSubview:self.YearTF];
    [self addSubview:self.CityTF];
    [self addSubview: self.sureBtn];
}
-(void)layoutViews
{


    [self.logoV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(@(GTFixHeightFlaot(80)));
        make.height.equalTo(self.logoV.mas_height);
        make.width.equalTo(self.logoV.mas_width);
    }];

    [self.NickTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(GTFixWidthFlaot(10)));
        make.top.equalTo(self.logoV.mas_bottom).offset(30);
        make.height.equalTo(@(GTFixHeightFlaot(40)));
        make.right.equalTo(@(GTFixWidthFlaot(-10)));
    }];
    [self.YearTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(GTFixWidthFlaot(10)));
        make.top.equalTo(self.NickTF.mas_bottom).offset(20);
        make.height.equalTo(@(GTFixHeightFlaot(40)));
        make.right.equalTo(@(GTFixWidthFlaot(-10)));
    }];


    [self.CityTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(GTFixWidthFlaot(10)));
        make.top.equalTo(self.YearTF.mas_bottom).offset(20);
        make.height.equalTo(@(GTFixHeightFlaot(40)));
        make.right.equalTo(@(GTFixWidthFlaot(-10)));
    }];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.left.equalTo(@(GTFixWidthFlaot(10)));
        make.right.equalTo(@(GTFixWidthFlaot(-10)));
        make.height.equalTo(@(GTFixHeightFlaot(40)));
        make.top.equalTo(self.CityTF.mas_bottom).offset(50);
        self.sureBtn.layer.cornerRadius=GTFixHeightFlaot(3);

    }];
}
@end





