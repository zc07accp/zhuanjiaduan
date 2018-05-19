
//
//  FourView.m
//  Zero
//
//  Created by 方涛 on 2018/4/25.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "FourView.h"

@implementation FourView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end


@implementation WoDeShouCangView
-(void)loadViews{
    self.backgroundColor=[AppStyleConfiguration ColorWithBaseBoard];
    self.xueXiFangFaBtn=[UIButton buttonWithTitle:@"学习方法" withTitleColor:[AppStyleConfiguration ColorWithTextOne] withSize:14 withImageName:@"ico_down_zsd" withBGColor:[UIColor whiteColor]];
    [self.xueXiFangFaBtn setBackgroundColor:[UIColor whiteColor]];
    self.xueXiFangFaBtn.layer.cornerRadius=0;
    [self.xueXiFangFaBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:20];
    [self.xueXiFangFaBtn setTitleColor:[AppStyleConfiguration ColorWithMain] forState:UIControlStateSelected];
    [self.xueXiFangFaBtn setImage:[UIImage imageNamed:@"ico_up_s_zsd"] forState:UIControlStateSelected];
    
    
    self.zhiShiDianBtn=[UIButton buttonWithTitle:@"知识点课堂" withTitleColor:[AppStyleConfiguration ColorWithTextOne] withSize:14 withImageName:@"ico_down_zsd" withBGColor:[UIColor whiteColor]];
    [self.zhiShiDianBtn setBackgroundColor:[UIColor whiteColor]];
    [self.zhiShiDianBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:20];
    self.zhiShiDianBtn.layer.cornerRadius=0;
    [self.zhiShiDianBtn setTitleColor:[AppStyleConfiguration ColorWithMain] forState:UIControlStateSelected];
    [self.zhiShiDianBtn setImage:[UIImage imageNamed:@"ico_up_s_zsd"] forState:UIControlStateSelected];
    
    self.line=[UIView new];
    self.line.backgroundColor=[UIColor lightGrayColor];
    self.line0=[UIView new];
    self.line0.backgroundColor=[AppStyleConfiguration ColorWithMain];
    self.bgView=[UIView new];
    self.bgView.backgroundColor=[UIColor colorWithRed:0.87f green:0.87f blue:0.87f alpha:1.00f];
    
    self.tableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.isZhiShiDian=NO;
  
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.xueXiFangFaBtn];
    [self.bgView addSubview:self.zhiShiDianBtn];
    [self.bgView addSubview:self.line];
    [self.bgView addSubview:self.line0];
    [self addSubview:self.tableView];
}
-(void)layoutViews{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.height.equalTo(@40);
    }];
    
    [self.xueXiFangFaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@0);
        make.bottom.equalTo(@-1);
        make.right.equalTo(self.bgView.mas_centerX);
    }];
    [self.zhiShiDianBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(@0);
        make.bottom.equalTo(@-1);
        make.left.equalTo(self.bgView.mas_centerX);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.xueXiFangFaBtn);
        make.centerX.equalTo(self.xueXiFangFaBtn.mas_right);
        make.width.equalTo(@1);
        make.bottom.equalTo(self.xueXiFangFaBtn.mas_bottom).offset(-10);
        
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.top.equalTo(self.bgView.mas_bottom);
        
    }];
    

    
}
-(void)setIsZhiShiDian:(BOOL)isZhiShiDian{
    _isZhiShiDian=isZhiShiDian;
    if (_isZhiShiDian) {
        [UIView animateWithDuration:0.5 animations:^{
            self.line0.frame=CGRectMake(kMainScreen_width*0.5, 35, kMainScreen_width*0.5, 5);
        }];

    }else{
        [UIView animateWithDuration:0.5 animations:^{
            self.line0.frame=CGRectMake(0, 35, kMainScreen_width*0.5, 5);
        }];

    }
}


@end

@implementation MyTeacherCell0
-(void)loadViews{
    self.headImgV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_touxiang_wode"]];
    
    self.titLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:16] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@"数学"];
    
    self.nameLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:14] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@"张小白老师"];

    self.jieBangBtn=[UIButton buttonWithTitle:@"解绑" withTitleColor:[AppStyleConfiguration ColorWithMain] withSize:16 withImageName:nil withBGColor:nil];
    
    [self addSubview:self.headImgV];
    [self addSubview:self.titLab];
    [self addSubview:self.nameLab];
    [self addSubview:self.jieBangBtn];
}
-(void)layoutViews{
    [self.headImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.centerY.equalTo(@0);
        make.bottom.equalTo(@-10);
        make.height.width.equalTo(@40);
        ViewRadius(self.headImgV, 20);
      
    }];
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgV.mas_right).offset(15);
        make.centerY.equalTo(@0);
        make.height.equalTo(self.titLab.mas_height);
        make.width.equalTo(@45);
    }];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titLab.mas_right).offset(15);
        make.centerY.equalTo(@0);
        make.height.equalTo(self.nameLab.mas_height);
        make.width.equalTo(self.nameLab.mas_width);
    }];
    [self.jieBangBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-20);
        make.centerY.equalTo(@0);
        make.height.equalTo(self.jieBangBtn.mas_height);
        make.width.equalTo(self.jieBangBtn.mas_width);
    }];

}

@end

@implementation JiaTingZuoYeCell0
-(void)loadViews{
    self.headImgV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_xinfeng"]];
    self.numLab=[FTLabel labelWithSize:7 withColor:[UIColor whiteColor] withText:@"58"];
    self.numLab.edgeInsets=UIEdgeInsetsMake(0, 2, 0, 2);
    self.numLab.backgroundColor=[UIColor redColor];
    
    self.titLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:16] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@"数学"];
    
    
    [self addSubview:self.headImgV];
    [self addSubview:self.numLab];
    [self addSubview:self.titLab];

}
-(void)layoutViews{
    [self.headImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_left).offset(35);
        make.height.equalTo(self.headImgV.mas_height);
        make.width.equalTo(self.headImgV.mas_width);
        make.centerY.equalTo(@0);

    }];
    [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headImgV.mas_right);
        make.centerY.equalTo(self.headImgV.mas_top);
        make.height.equalTo(self.numLab);
        make.width.equalTo(self.numLab.mas_width);
        ViewRadius(self.numLab, 5);
    }];
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@70);
        make.centerY.equalTo(@0);
        make.height.equalTo(self.titLab.mas_height);
        make.width.equalTo(self.titLab.mas_width);
    }];

}

@end
@implementation ShaiXuanHeadView
-(void)loadViews{
    self.backgroundColor=[UIColor whiteColor];
    self.titLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:16] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@"题型"];
    
    [self addSubview:self.titLab];
}
-(void)layoutViews{
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.centerY.equalTo(@0);
        make.right.equalTo(@-15);
        make.height.equalTo(self.titLab.mas_height);

    }];

}

@end

@implementation VIPHUiYuanView
-(void)loadViews{
    self.titLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:18] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@"会员剩余天数"];
    self.titLab.textAlignment=NSTextAlignmentCenter;
    
    self.dayLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:50] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@"0"];
    self.dayLab.textAlignment=NSTextAlignmentCenter;
    
    self.bgView=[UIView new];
    self.bgView.backgroundColor=[AppStyleConfiguration ColorWithMain];
    
    self.contentV = [UIView new];
    
    self.moneyLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:16] withColor:[AppStyleConfiguration ColorWithMain] withText:@"支付金额：50元"];
    self.moneyLab.textAlignment=NSTextAlignmentCenter;

    self.zhiFuBaoBtn=[UIButton buttonWithTitle:@"支付宝购买" withTitleColor:[AppStyleConfiguration ColorWithTextOne] withSize:16 withImageName:nil withBGColor:[AppStyleConfiguration ColorWithMain]];
    
    self.weiXinBtn=[UIButton buttonWithTitle:@"微信支付购买" withTitleColor:[AppStyleConfiguration ColorWithTextOne] withSize:16 withImageName:nil withBGColor:[AppStyleConfiguration ColorWithMain]];

    [self addSubview:self.bgView];
    [self.bgView addSubview:self.dayLab];
    [self.bgView addSubview:self.titLab];
    [self addSubview:self.contentV];
    [self addSubview:self.moneyLab];
    [self addSubview:self.zhiFuBaoBtn];
    [self addSubview:self.weiXinBtn];


}
-(void)layoutViews{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(@0);
      
    }];
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(@20);
        make.height.equalTo(self.titLab.mas_height);
        make.width.equalTo(self.titLab.mas_width);
    }];
    [self.dayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.centerY.equalTo(@10);
        make.height.equalTo(self.dayLab.mas_height);
        make.width.equalTo(self.dayLab.mas_width);
        make.bottom.equalTo(@-60);

    }];
    [self.contentV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.right.equalTo(@-20);
        make.top.equalTo(self.bgView.mas_bottom);
        make.height.equalTo(self.contentV);

    }];
    [self.moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.height.equalTo(self.moneyLab.mas_height);
        make.width.equalTo(self.moneyLab.mas_width);
        make.top.equalTo(self.contentV.mas_bottom).offset(5);

    }];

    [self.zhiFuBaoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@40);
        make.top.equalTo(self.moneyLab.mas_bottom).offset(30);
        make.centerX.equalTo(@0);
        make.height.equalTo(@40);
        ViewRadius(self.zhiFuBaoBtn, 20);
    }];
    [self.weiXinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.zhiFuBaoBtn);
        make.top.equalTo(self.zhiFuBaoBtn.mas_bottom).offset(20);
        make.centerX.equalTo(@0);
        make.height.equalTo(self.zhiFuBaoBtn);
        ViewRadius(self.weiXinBtn, 20);
    }];

}
-(void)loadViewDataWithModel:(id)model{
    NSArray *arr=@[@"30天",@"90天",@"120天"];
    for (int i=0; i<arr.count; i++) {
        FTLabel *lab=[FTLabel labelWithSize:18 withColor:[AppStyleConfiguration ColorWithMain] withText:arr[i]];
        lab.edgeInsets=UIEdgeInsetsMake(5, 10, 5, 10);
        lab.tag=i+100;
        lab.textAlignment=NSTextAlignmentCenter;
        lab.userInteractionEnabled=YES;
        ViewBorderRadius(lab, 8, 1, [AppStyleConfiguration ColorWithMain]);
        [self.contentV addSubview:lab];
        lab.frame=CGRectMake(20+(20+(kMainScreen_width-40-80)/3)*(i%3), 20+55*(i/3), (kMainScreen_width-40-80)/3, 35);
        if (i==arr.count-1) {
            [self.contentV mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@20);
                make.right.equalTo(@-20);
                make.top.equalTo(self.bgView.mas_bottom);
                make.bottom.equalTo(lab.mas_bottom).offset(20);
                
            }];
        }
        kWeakSelf(lab)
        kWeakSelf(self)
        [lab addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            if ([weakself respondsToSelector:@selector(selectDayWithLab:)]) {
                [weakself selectDayWithLab:weaklab];
            }
            [weakself reSetLabColorWith:arr.count AndLab:weaklab];
        }];


    }
}
-(void)reSetLabColorWith:(NSInteger)num AndLab:(FTLabel*)selectLab{
    for (int i=0; i<num; i++) {
        FTLabel *lab=(FTLabel *)[self.contentV viewWithTag:i+100];
        
        
        
        
        lab.backgroundColor=[UIColor clearColor];
        
        
        lab.textColor=[AppStyleConfiguration ColorWithMain];
        
        
        
        ViewBorderRadius(lab, 8, 1, [AppStyleConfiguration ColorWithMain]);
    }
    
    ViewRadius(selectLab, 8);
    selectLab.textColor=[AppStyleConfiguration ColorWithTextOne];
    selectLab.backgroundColor=[AppStyleConfiguration ColorWithMain];
}
@end
@implementation ChangeCellView
-(void)loadViews{
    
    self.phoneTF=[FTTextFiled new];
    [self.phoneTF creatTextFiledWithImage:@"icon_qiandao"];
    self.phoneTF.tf.placeholder=@"请输入您的手机号";
    [self.phoneTF line];
    self.phoneTF.backgroundColor=[UIColor whiteColor];
    self.phoneTF.tf.textColor=[AppStyleConfiguration ColorWithTextOne];
    [self.phoneTF.tf setTintColor:[AppStyleConfiguration ColorWithTextOne]];
    self.phoneTF.tf.clearButtonMode=UITextFieldViewModeUnlessEditing;
    [self.phoneTF phone];
    
    self.codeTF=[FTTextFiled new];
    [self.codeTF creatTextFiledWithImage:@"icon_qiandao"];
    self.codeTF.tf.placeholder=@"输入验证码";
    [self.codeTF line];
    self.codeTF.backgroundColor=[UIColor whiteColor];
    self.codeTF.tf.textColor=[AppStyleConfiguration ColorWithTextOne];
    [self.codeTF.tf setTintColor:[AppStyleConfiguration ColorWithTextOne]];
    [self.codeTF checkCode];
    self.codeTF.codeBtn.backgroundColor=[UIColor clearColor];
    [self.codeTF.codeBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
 
    
    self.sureBtn=[UIButton buttonWithTitle:@"下一步" withImageName:nil withBGColor:[AppStyleConfiguration ColorWithMain] Withlayer:YES];
    [self.sureBtn setTitleColor:[AppStyleConfiguration ColorWithTextOne] forState:UIControlStateNormal];
    
    
  
    [self addSubview:self.phoneTF];
    [self addSubview:self.codeTF];
   
    [self addSubview: self.sureBtn];
}
-(void)layoutViews{
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.height.equalTo(@50);
        make.left.equalTo(@15);
        make.right.equalTo(@-15);
    }];
    [self.codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneTF.mas_bottom);
        make.height.equalTo(self.phoneTF);
        make.left.equalTo(@15);
        make.right.equalTo(@-15);
    }];
    [self.codeTF.codeBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.right.equalTo(@-10);
        make.height.equalTo(self.codeTF.codeBtn);
        make.width.equalTo(@80);
    }];
  
    
    
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.left.equalTo(@15);
        make.height.equalTo(@40);
        make.top.equalTo(self.codeTF.mas_bottom).offset(100);
        ViewRadius(self.sureBtn, 5);
    }];
    
    
}



@end

@implementation YiBangDingView
-(void)loadViews{
    self.headImgV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_touxiang_wode"]];
    
    self.titLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:16] withColor:[AppStyleConfiguration ColorWithMain] withText:@"欢迎使用零错题"];
    self.titLab.textAlignment=NSTextAlignmentCenter;
    
    
    self.cellLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:16] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@"您的手机号为：18651947533"];
    self.titLab.textAlignment=NSTextAlignmentCenter;
    
    self.contengLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:14] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@"此账号已绑定手机号，我们将为您提供更好的服务"];
    self.titLab.textAlignment=NSTextAlignmentCenter;
    
    self.sureBtn=[UIButton buttonWithTitle:@"更换手机号" withImageName:nil withBGColor:[AppStyleConfiguration ColorWithMain] Withlayer:YES];
    [self.sureBtn setTitleColor:[AppStyleConfiguration ColorWithTextOne] forState:UIControlStateNormal];
    
    [self addSubview:self.headImgV];
    [self addSubview:self.titLab];
    [self addSubview:self.cellLab];
    [self addSubview:self.contengLab];
    [self addSubview:self.sureBtn];
}
-(void)layoutViews{
    [self.headImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(@30);
        make.height.equalTo(self.headImgV.mas_height);
        make.width.equalTo(self.headImgV.mas_width);
    }];
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(self.headImgV.mas_bottom).offset(40);
        make.height.equalTo(self.titLab.mas_height);
        make.width.equalTo(self.titLab.mas_width);
    }];
    [self.cellLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(self.titLab.mas_bottom).offset(30);
        make.height.equalTo(self.cellLab.mas_height);
        make.width.equalTo(self.cellLab.mas_width);
    }];
    [self.contengLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(self.cellLab.mas_bottom).offset(15);
        make.height.equalTo(self.contengLab.mas_height);
        make.width.equalTo(self.contengLab.mas_width);
    }];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.left.equalTo(@20);
        make.height.equalTo(@40);
        make.top.equalTo(self.contengLab.mas_bottom).offset(80);

    }];

}

@end

@implementation BangDingZhiFubaoCell0
-(void)loadViews{
    self.backgroundColor=[UIColor whiteColor];
     self.titLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:14] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@"姓名"];
    
    self.textTF=[UITextField new];
    self.textTF.tintColor=[AppStyleConfiguration ColorWithTextOne];
    self.textTF.textColor=[AppStyleConfiguration ColorWithTextOne];
    self.textTF.font=[AppStyleConfiguration appFont:14];
    
    self.codeBtn=[UIButton buttonWithTitle:@"获取验证码" withTitleColor:[AppStyleConfiguration ColorWithMain] withSize:16 withImageName:nil withBGColor:[UIColor whiteColor]];
    
    [self addSubview:self.titLab];
    [self addSubview:self.textTF];
    [self addSubview:self.codeBtn];
}
-(void)layoutViews{
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.centerY.equalTo(@0);
        make.height.equalTo(self.titLab.mas_height);
        make.width.equalTo(self.titLab.mas_width);
    }];
    [self.textTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@115);
        make.right.equalTo(@-20);
        make.top.bottom.equalTo(@0);
      
    }];
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-20);
        make.centerY.equalTo(@0);
        make.width.equalTo(@100);
        make.height.equalTo(@30);
        ViewBorderRadius(self.codeBtn, 5, 1, [AppStyleConfiguration ColorWithMain]);
    }];
}
@end
//@interface ChongZhiPwdView : BaseView
//@property(nonatomic,strong)FTTextFiled *oldPwd;
//@property(nonatomic,strong)FTTextFiled *xinPwd;
//@property(nonatomic,strong)UIButton *sureBtn;
//@end

@implementation ChongZhiPwdView
-(void)loadViews{
    self.oldPwd=[FTTextFiled new];
    [self.oldPwd creatTextFiledWithImage:@"icon_qiandao"];
    self.oldPwd.tf.placeholder=@"请输入旧密码";
    [self.oldPwd line];
    self.oldPwd.backgroundColor=[UIColor whiteColor];
    self.oldPwd.tf.textColor=[AppStyleConfiguration ColorWithTextOne];
    [self.oldPwd.tf setTintColor:[AppStyleConfiguration ColorWithTextOne]];
    self.oldPwd.tf.clearButtonMode=UITextFieldViewModeUnlessEditing;

    self.xinPwd=[FTTextFiled new];
    [self.xinPwd creatTextFiledWithImage:@"icon_qiandao"];
    self.xinPwd.tf.placeholder=@"请输入新密码";
    [self.xinPwd line];
    self.xinPwd.backgroundColor=[UIColor whiteColor];
    self.xinPwd.tf.textColor=[AppStyleConfiguration ColorWithTextOne];
    [self.xinPwd.tf setTintColor:[AppStyleConfiguration ColorWithTextOne]];
    
    self.sureBtn=[UIButton buttonWithTitle:@"完成" withImageName:nil withBGColor:[AppStyleConfiguration ColorWithMain] Withlayer:YES];
    [self.sureBtn setTitleColor:[AppStyleConfiguration ColorWithTextOne] forState:UIControlStateNormal];
    
    [self addSubview:self.oldPwd];
    [self addSubview:self.xinPwd];
    [self addSubview: self.sureBtn];
}
-(void)layoutViews{
    [self.oldPwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@15);
        make.height.equalTo(@50);
        make.left.equalTo(@15);
        make.right.equalTo(@-15);
    }];
    [self.xinPwd mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oldPwd.mas_bottom);
        make.height.equalTo(self.oldPwd);
        make.left.equalTo(@15);
        make.right.equalTo(@-15);
    }];
  
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.left.equalTo(@15);
        make.height.equalTo(@40);
        make.top.equalTo(self.xinPwd.mas_bottom).offset(100);
        ViewRadius(self.sureBtn, 5);
    }];
    
    
}
@end
