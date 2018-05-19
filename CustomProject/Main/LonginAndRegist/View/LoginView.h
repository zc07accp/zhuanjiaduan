//
//  LoginView.h
//  CustomProject
//
//  Created by 方涛 on 2017/5/10.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "BaseView.h"
#import "FTTextFiled.h"
@interface LoginView : BaseView
@property(nonatomic,strong)UIImageView *logoV;
@property(nonatomic,strong)FTTextFiled *userNameTF;
@property(nonatomic,strong)FTTextFiled *passWordTF;
@property(nonatomic,strong)UIButton *forgetBtn;
@property(nonatomic,strong)UIButton *registBtn;
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)UIView *bgView;
@end


@interface RegistView : BaseView
@property(nonatomic,strong)FTTextFiled *phoneTF;
@property(nonatomic,strong)FTTextFiled *codeTF;
@property(nonatomic,strong)UIImageView *logoV;
@property(nonatomic,strong)UIButton *sureBtn;
@property(nonatomic,strong)UILabel *zhuCeXieYiLab1;
@end
@interface ForgetView : BaseView

@property(nonatomic,strong)FTTextFiled *phoneTF;
@property(nonatomic,strong)FTTextFiled *codeTF;
@property(nonatomic,strong)FTTextFiled *pwdTF;
@property(nonatomic,strong)FTTextFiled *pwdTFAgain;
@property (nonatomic, strong) UILabel *tishiALbel;
@property(nonatomic,strong)UIButton *codeBtn;
@property(nonatomic,strong)UIButton *sureBtn;


@end

@interface ForgetTwoView : BaseView


@property(nonatomic,strong)FTTextFiled *pwdTF;
@property(nonatomic,strong)FTTextFiled *pwdTFAgain;
@property(nonatomic,strong)UIButton *codeBtn;
@property(nonatomic,strong)UIButton *sureBtn;


@end



@interface RegistDetailView : BaseView

@property(nonatomic,strong)FTTextFiled *NickTF;
@property(nonatomic,strong)FTTextFiled *YearTF;
@property(nonatomic,strong)FTTextFiled *CityTF;

@property(nonatomic,strong)UIImageView *logoV;
@property(nonatomic,strong)UIButton *sureBtn;



@end




