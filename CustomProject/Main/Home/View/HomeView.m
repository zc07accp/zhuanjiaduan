
//
//  HomeView.m
//  Zero
//
//  Created by 方涛 on 2018/4/24.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "HomeView.h"
#import "UITextView+PlaceHolder.h"

@implementation HomeView
-(void)loadViews{
    self.backgroundColor=[AppStyleConfiguration ColorWithBaseBoard];
    self.iconImgV0=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_biechuo_shouye"]];
    self.iconImgV1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_ling_shouye"]];
    self.bottomImgV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_bolang"]];

    self.paiZhao=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_paizhao_shouye"]];
    self.paiZhao.userInteractionEnabled=YES;

    self.setTextBtn=[UIButton buttonWithTitle:@"文字输入" withTitleColor:[AppStyleConfiguration ColorWithTextOne] withSize:14 withImageName:@"" withBGColor:[UIColor clearColor]];
    
    [self addSubview:self.iconImgV0];
    [self addSubview:self.iconImgV1];
    [self addSubview:self.paiZhao];
    [self addSubview:self.setTextBtn];
    [self addSubview:self.bottomImgV];
}
-(void)layoutViews{
    [self.iconImgV0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(@20);
        make.height.equalTo(self.iconImgV0.mas_height);
        make.width.equalTo(self.iconImgV0.mas_width);
    }];
    [self.paiZhao mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.centerX.equalTo(@0);
        make.height.equalTo(self.paiZhao.mas_height);
        make.width.equalTo(self.paiZhao.mas_width);
    }];
    [self.iconImgV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.bottom.equalTo(self.paiZhao.mas_top).offset(-20);
        make.height.equalTo(self.iconImgV1.mas_height);
        make.width.equalTo(self.iconImgV1.mas_width);
    }];
    [self.setTextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(self.paiZhao.mas_bottom).offset(20);
        make.width.equalTo(@160);
        make.height.equalTo(@35);
        ViewBorderRadius(self.setTextBtn, 8, 1, [AppStyleConfiguration ColorWithTextThree]);
      
    }];
    [self.bottomImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@(57/(750/kMainScreen_width)));
    }];

}

@end
@implementation WenZiLuTiView
-(void)loadViews{
    self.backgroundColor=[AppStyleConfiguration ColorWithBaseBoard];
    self.titleTextV=[UITextView new];
    self.titleTextV.backgroundColor=[UIColor whiteColor];
    self.titleTextV.tintColor=[AppStyleConfiguration ColorWithTextOne];
    self.titleTextV.textColor=[AppStyleConfiguration ColorWithTextOne];
    self.titleTextV.font=[AppStyleConfiguration appFont:14];
    [self.titleTextV addPlaceHolder:@"请在此处输入错题题目"];
    
    
    self.contentTextV=[UITextView new];
    self.contentTextV.backgroundColor=[UIColor whiteColor];
    self.contentTextV.tintColor=[AppStyleConfiguration ColorWithTextOne];
    self.contentTextV.textColor=[AppStyleConfiguration ColorWithTextOne];
    self.contentTextV.font=[AppStyleConfiguration appFont:14];
    [self.contentTextV addPlaceHolder:@"请在此处输入正确答案"];
    
    self.titLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:12] withColor:[AppStyleConfiguration ColorWithTextTwo] withText:[NSString stringWithFormat:@"%@/200",@"0"]];
    
    self.contentLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:12] withColor:[AppStyleConfiguration ColorWithTextTwo] withText:[NSString stringWithFormat:@"%@/1000",@"0"]];

    [self addSubview:self.titleTextV];
    [self addSubview:self.titLab];
    [self addSubview:self.contentTextV];
    [self addSubview:self.contentLab];
}
-(void)layoutViews{
    [self.titleTextV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@15);
        make.right.equalTo(@-15);
        make.height.equalTo(@180);
    }];
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.titleTextV.mas_right);
        make.top.equalTo(self.titleTextV.mas_bottom).offset(5);
        make.height.equalTo(self.titLab.mas_height);
        make.width.equalTo(self.titLab.mas_width);
    }];
    [self.contentTextV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titLab.mas_bottom).offset(15);
        make.left.equalTo(@15);
        make.right.equalTo(@-15);
        make.height.equalTo(@180);
    }];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentTextV.mas_right);
        make.top.equalTo(self.contentTextV.mas_bottom).offset(5);
        make.height.equalTo(self.contentLab.mas_height);
        make.width.equalTo(self.contentLab.mas_width);
    }];
}

@end

@implementation BeiZhuXingXiView
-(void)loadViews{
    self.backgroundColor=[AppStyleConfiguration ColorWithBaseBoard];
    self.TextV=[UITextView new];
    self.TextV.backgroundColor=[UIColor whiteColor];
    self.TextV.tintColor=[AppStyleConfiguration ColorWithTextOne];
    self.TextV.textColor=[AppStyleConfiguration ColorWithTextOne];
    self.TextV.font=[AppStyleConfiguration appFont:14];
    [self.TextV addPlaceHolder:@"请在此处输入错题相关的备注"];
    
    self.titLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:12] withColor:[AppStyleConfiguration ColorWithTextTwo] withText:[NSString stringWithFormat:@"%@/200",@"0"]];

    self.sureBtn=[UIButton buttonWithTitle:@"保存" withImageName:@"" withBGColor:[AppStyleConfiguration ColorWithMain] Withlayer:YES];
    [self.sureBtn setTitleColor:[AppStyleConfiguration ColorWithTextOne] forState:UIControlStateNormal];
    
    
    [self addSubview:self.TextV];
    [self addSubview:self.titLab];
    [self addSubview:self.sureBtn];
}
-(void)layoutViews{
    [self.TextV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@15);
        make.right.equalTo(@-15);
        make.height.equalTo(@220);
    }];
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.TextV.mas_right);
        make.top.equalTo(self.TextV.mas_bottom).offset(5);
        make.height.equalTo(self.titLab.mas_height);
        make.width.equalTo(self.titLab.mas_width);
    }];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(self.titLab.mas_bottom).offset(30);
        make.height.equalTo(@40);
        make.left.equalTo(@40);
        ViewRadius(self.sureBtn, 20);
    }];

}

@end
@implementation XiangQingChooseView
-(void)loadViews{
    self.backgroundColor=[AppStyleConfiguration ColorWithBaseBoard];
    self.neiRongBtn=[UIButton buttonWithTitle:@"错题内容" withTitleColor:[AppStyleConfiguration ColorWithTextOne] withSize:14 withImageName:@"" withBGColor:[UIColor whiteColor]];
    [self.neiRongBtn setBackgroundColor:[UIColor whiteColor]];
    self.neiRongBtn.layer.cornerRadius=0;
    
    
    self.biaoQianBtn=[UIButton buttonWithTitle:@"错题标签" withTitleColor:[AppStyleConfiguration ColorWithTextOne] withSize:14 withImageName:@"" withBGColor:[UIColor whiteColor]];
    [self.biaoQianBtn setBackgroundColor:[UIColor whiteColor]];
    self.biaoQianBtn.layer.cornerRadius=0;
    
  
    self.line0=[UIView new];
    self.line0.backgroundColor=[AppStyleConfiguration ColorWithMain];
    self.line0.frame=CGRectMake(0, 38, kMainScreen_width*0.5, 2);

    self.bgView=[UIView new];
    self.bgView.backgroundColor=[UIColor colorWithRed:0.87f green:0.87f blue:0.87f alpha:1.00f];
    
    self.isBiaoQian=NO;
    
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.neiRongBtn];
    [self.bgView addSubview:self.biaoQianBtn];
    [self.bgView addSubview:self.line0];
}
-(void)layoutViews{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.height.equalTo(@40);
    }];
    
    [self.neiRongBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@0);
        make.bottom.equalTo(@-1);
        make.right.equalTo(self.bgView.mas_centerX);
    }];
    [self.biaoQianBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(@0);
        make.bottom.equalTo(@-1);
        make.left.equalTo(self.bgView.mas_centerX);
    }];
   
   
    
    
}
-(void)setIsBiaoQian:(BOOL)isBiaoQian{
    _isBiaoQian=isBiaoQian;
    if (_isBiaoQian) {
        [UIView animateWithDuration:0.3 animations:^{
            self.line0.frame=CGRectMake(kMainScreen_width*0.5, 38, kMainScreen_width*0.5, 2);
            [self.biaoQianBtn setTitleColor:[AppStyleConfiguration ColorWithMain] forState:UIControlStateNormal];
            [self.neiRongBtn setTitleColor:[AppStyleConfiguration ColorWithTextOne] forState:UIControlStateNormal];
        }];
      
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            self.line0.frame=CGRectMake(0, 38, kMainScreen_width*0.5, 2);
            [self.neiRongBtn setTitleColor:[AppStyleConfiguration ColorWithMain] forState:UIControlStateNormal];
            [self.biaoQianBtn setTitleColor:[AppStyleConfiguration ColorWithTextOne] forState:UIControlStateNormal];
        }];
      

    }
}



@end

@implementation XiangQingThreeBtnView
-(void)loadViews{
    self.backgroundColor=[UIColor whiteColor];
    self.buChongBtn=[UIButton buttonWithTitle:@"\t\t补充题干" withTitleColor:[UIColor whiteColor] withSize:14 withImageName:@"ico_buchong_timu" withBGColor:[UIColor blackColor]];
    [self.buChongBtn setBackgroundColor:[UIColor blackColor]];
    self.buChongBtn.layer.cornerRadius=0;
    
    self.zhengJieBtn=[UIButton buttonWithTitle:@"\t\t正解图片" withTitleColor:[UIColor whiteColor] withSize:14 withImageName:@"ico_zhengjie_timu" withBGColor:[UIColor blackColor]];
    [self.zhengJieBtn setBackgroundColor:[UIColor blackColor]];
    self.zhengJieBtn.layer.cornerRadius=0;
    
    self.beiZhuBtn=[UIButton buttonWithTitle:@"\t\t备注信息" withTitleColor:[UIColor whiteColor] withSize:14 withImageName:@"ico_beizhu_timu" withBGColor:[UIColor blackColor]];
    [self.beiZhuBtn setBackgroundColor:[UIColor blackColor]];
    self.beiZhuBtn.layer.cornerRadius=0;

    [self addSubview:self.buChongBtn];
    [self addSubview:self.zhengJieBtn];
    [self addSubview:self.beiZhuBtn];
}
-(void)layoutViews{
    [self.buChongBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);

    }];
    [self.zhengJieBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.height.equalTo(self.buChongBtn);
        make.top.equalTo(self.buChongBtn.mas_bottom).offset(1);

    }];
    [self.beiZhuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.top.equalTo(self.zhengJieBtn.mas_bottom).offset(1);
        make.height.equalTo(self.buChongBtn);

    }];
}

@end

@implementation CuoTiNeiRongCell0
-(void)loadViews{
    self.backgroundColor=[AppStyleConfiguration ColorWithBaseBoard];
    
    self.imgV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_huaxue_cuoti"]];
    self.imgV.userInteractionEnabled=YES;
    
    [self addSubview:self.imgV];
}
-(void)layoutViews{
    [self.imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.bottom.equalTo(@-7);
        make.height.equalTo(@(self.imgV.image.size.height/(self.imgV.image.size.width/kMainScreen_width)));
      
    }];

}

@end
//@interface CuoTiNeiRongHeadView : BaseView
//@property(nonatomic,strong)UILabel *titLab;//
//
//@end
@implementation CuoTiNeiRongHeadView
-(void)loadViews{
    self.backgroundColor=[UIColor whiteColor];
    self.titLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:16] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@"题干"];
    
    [self addSubview:self.titLab];
}
-(void)layoutViews{
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.right.equalTo(@-20);
        make.centerY.equalTo(@0);
        make.height.equalTo(self.titLab.mas_height);

    }];

}

@end

@implementation BiaoQianShuRuKuang
-(void)loadViews{
    self.backgroundColor=[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5f];
    self.bgView=[UIView new];
    self.bgView.backgroundColor=[UIColor whiteColor];
    
    self.titLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:16] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@"请输入错题来源标签"];
    self.titLab.textAlignment=NSTextAlignmentCenter;
    
    self.textTF=[UITextField new];
    self.textTF.tintColor=[AppStyleConfiguration ColorWithTextOne];
    self.textTF.textColor=[AppStyleConfiguration ColorWithTextOne];
    self.textTF.placeholder=@"不超过8个字";
    self.textTF.font=[AppStyleConfiguration appFont:14];
    UILabel * leftView = [[UILabel alloc] initWithFrame:CGRectMake(10,0,7,26)];
    leftView.backgroundColor = [UIColor clearColor];
    self.textTF.leftViewMode = UITextFieldViewModeAlways;

    self.textTF.leftView = leftView;
    
    self.cancelBtn=[UIButton buttonWithTitle:@"取消" withTitleColor:[AppStyleConfiguration ColorWithTextOne] withSize:14 withImageName:@"" withBGColor:nil];
    
    self.sureBtn=[UIButton buttonWithTitle:@"立即添加" withTitleColor:[AppStyleConfiguration ColorWithMain] withSize:14 withImageName:@"" withBGColor:nil];

    
    
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.titLab];
    [self.bgView addSubview:self.textTF];
    [self.bgView addSubview:self.cancelBtn];
    [self.bgView addSubview:self.sureBtn];
}
-(void)layoutViews{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(@180);
        make.left.equalTo(@40);
        ViewRadius(self.bgView, 6);
  
    }];
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(@25);
        make.height.equalTo(self.titLab.mas_height);
        make.width.equalTo(self.titLab.mas_width);
    }];
    [self.textTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@25);
        make.right.equalTo(@-25);
        make.top.equalTo(self.titLab.mas_bottom).offset(25);
        make.height.equalTo(@35);
        ViewBorderRadius(self.textTF, 5, 1, [AppStyleConfiguration ColorWithMain]);
    }];
  
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(@0);
        make.left.equalTo(self.bgView.mas_centerX).offset(-0.5);
        make.height.equalTo(@40);
        ViewBorderRadius(self.sureBtn, 0, 1, [AppStyleConfiguration ColorWithBaseBoard]);
    }];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(@0);
        make.right.equalTo(self.bgView.mas_centerX).offset(0.5);
        make.height.equalTo(@40);
        make.top.equalTo(self.textTF.mas_bottom).offset(40);
        ViewBorderRadius(self.cancelBtn, 0, 1, [AppStyleConfiguration ColorWithBaseBoard]);

    }];
}

@end

@implementation LuTiChengGongView
-(void)loadViews{
    self.backgroundColor=[UIColor whiteColor];
    self.headImgV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_chenggong_luti"]];
    
    self.titLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:18] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@"录题成功"];
    
    self.jieSuBtn=[UIButton buttonWithTitle:@"结束录题" withTitleColor:[AppStyleConfiguration ColorWithTextOne] withSize:18 withImageName:nil withBGColor:[AppStyleConfiguration ColorWithMain]];
    
    self.jiXuBtn=[UIButton buttonWithTitle:@"继续录题" withTitleColor:[AppStyleConfiguration ColorWithTextOne] withSize:18 withImageName:nil withBGColor:[AppStyleConfiguration ColorWithMain]];


    [self addSubview:self.headImgV];
    [self addSubview:self.titLab];
    [self addSubview:self.jieSuBtn];
    [self addSubview:self.jiXuBtn];
}
-(void)layoutViews{
    [self.headImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@-100);
        make.centerX.equalTo(@0);
        make.height.equalTo(self.headImgV.mas_height);
        make.width.equalTo(self.headImgV.mas_width);
    }];
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.top.equalTo(self.headImgV.mas_bottom).offset(30);
        make.height.equalTo(self.titLab.mas_height);
        make.width.equalTo(self.titLab.mas_width);
    }];
    [self.jieSuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_centerX).offset(-10);
        make.top.equalTo(self.titLab.mas_bottom).offset(150);
        make.left.equalTo(@30);
        make.height.equalTo(@40);
        ViewRadius(self.jieSuBtn, 15);
    }];
    [self.jiXuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_centerX).offset(10);
        make.top.equalTo(self.titLab.mas_bottom).offset(150);
        make.right.equalTo(@-30);
        make.height.equalTo(@40);
        ViewRadius(self.jiXuBtn, 15);
    }];
}

@end
