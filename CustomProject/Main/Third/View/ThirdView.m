//
//  ThirdView.m
//  Zero
//
//  Created by 方涛 on 2018/4/24.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "ThirdView.h"
#import "UILabel+Add.h"

@implementation ThirdView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
@implementation ThirdCell0
-(void)loadViews{
    self.backgroundColor=[UIColor whiteColor];
    self.headImgV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_xuanshang_faxian"]];
    
    self.contengImgV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_tongzhi_faxian"]];
    
    self.titLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:14] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@"错题悬赏"];
    [self addSubview:self.headImgV];
    [self addSubview:self.contengImgV];
    [self addSubview:self.titLab];
}
-(void)layoutViews{
    [self.headImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_left).offset(35);
        make.centerY.equalTo(@0);
        make.height.equalTo(self.headImgV.mas_height);
        make.width.equalTo(self.headImgV.mas_width);
    }];
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@60);
        make.centerY.equalTo(@0);
        make.height.equalTo(self.titLab.mas_height);
        make.width.equalTo(self.titLab.mas_width);
    }];
    [self.contengImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-40);
        make.centerY.equalTo(@0);
        make.height.equalTo(self.contengImgV.mas_height);
        make.width.equalTo(self.contengImgV.mas_width);
    }];

}

@end

@implementation ThirdChooseView
-(void)loadViews{
    self.backgroundColor=[AppStyleConfiguration ColorWithBaseBoard];
    self.nianJiBtn=[UIButton buttonWithTitle:@"年级" withTitleColor:[AppStyleConfiguration ColorWithTextOne] withSize:14 withImageName:@"ico_down_zsd" withBGColor:[UIColor whiteColor]];
    [self.nianJiBtn setBackgroundColor:[UIColor whiteColor]];
    self.nianJiBtn.layer.cornerRadius=0;
    [self.nianJiBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:20];
    [self.nianJiBtn setTitleColor:[AppStyleConfiguration ColorWithMain] forState:UIControlStateSelected];
    [self.nianJiBtn setImage:[UIImage imageNamed:@"ico_up_s_zsd"] forState:UIControlStateSelected];
    
    
    self.keMuBtn=[UIButton buttonWithTitle:@"科目" withTitleColor:[AppStyleConfiguration ColorWithTextOne] withSize:14 withImageName:@"ico_down_zsd" withBGColor:[UIColor whiteColor]];
    [self.keMuBtn setBackgroundColor:[UIColor whiteColor]];
    [self.keMuBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleRight imageTitleSpace:20];
    self.keMuBtn.layer.cornerRadius=0;
    [self.keMuBtn setTitleColor:[AppStyleConfiguration ColorWithMain] forState:UIControlStateSelected];
    [self.keMuBtn setImage:[UIImage imageNamed:@"ico_up_s_zsd"] forState:UIControlStateSelected];

    self.line=[UIView new];
    self.line.backgroundColor=[UIColor lightGrayColor];
    self.bgView=[UIView new];
    self.bgView.backgroundColor=[UIColor colorWithRed:0.87f green:0.87f blue:0.87f alpha:1.00f];
    
    self.tableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    
//    self.jianTouImgV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_xian_zsd"]];
    self.jianTouImgV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"zsd_jt"]];
    self.jianTouImgV.contentMode=1;
    self.jianTouImgV.hidden=YES;
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.nianJiBtn];
    [self.bgView addSubview:self.keMuBtn];
    [self.bgView addSubview:self.line];
    [self addSubview:self.tableView];
    [self.bgView addSubview:self.jianTouImgV];
}
-(void)layoutViews{
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.height.equalTo(@40);
    }];

    [self.nianJiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@0);
        make.bottom.equalTo(@-1);
        make.right.equalTo(self.bgView.mas_centerX);
    }];
    [self.keMuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(@0);
        make.bottom.equalTo(@-1);
        make.left.equalTo(self.bgView.mas_centerX);
    }];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nianJiBtn);
        make.centerX.equalTo(self.nianJiBtn.mas_right);
        make.width.equalTo(@1);
        make.bottom.equalTo(self.nianJiBtn.mas_bottom).offset(-10);

    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.top.equalTo(self.bgView.mas_bottom);
      
    }];

  


}
-(void)setChooseType:(NSString *)chooseType{
    _chooseType=chooseType;
    if ([_chooseType isEqualToString:@"0"]) {
        self.nianJiBtn.selected=NO;
        self.keMuBtn.selected=NO;
        self.jianTouImgV.hidden=YES;

    }else if ([_chooseType isEqualToString:@"1"]) {
        self.jianTouImgV.hidden=NO;

        [self.jianTouImgV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.nianJiBtn);
            make.bottom.equalTo(@1);
            make.height.equalTo(@10);
            make.width.equalTo(@10);
        }];
        self.nianJiBtn.selected=YES;
        self.keMuBtn.selected=NO;
        
    }else{
        self.jianTouImgV.hidden=NO;

        [self.jianTouImgV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.keMuBtn);
            make.bottom.equalTo(@1);
            make.height.equalTo(@10);
            make.width.equalTo(@10);
        }];
        self.nianJiBtn.selected=NO;
        self.keMuBtn.selected=YES;
    }
}

@end

@implementation ZhiShiDianHeadView
-(void)loadViews{
    self.backgroundColor=[UIColor whiteColor];
    self.titLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:12] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@""];
    [self addSubview:self.titLab];
}
-(void)layoutViews{
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.centerY.equalTo(@0);
        make.height.equalTo(self.titLab.mas_height);
        make.width.equalTo(self.titLab.mas_width);
    }];

}
@end

@implementation ZhiShiDianCell0
-(void)loadViews{
    self.backgroundColor=[UIColor whiteColor];
    self.headImgV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_dili_cuoti"]];//loading_gray
//    self.headImgV.backgroundColor=[UIColor redColor];
//    self.headImgV.contentMode=1;
    self.startImgV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_shoucang_wode"]];

    self.titLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:14] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@"数学-几何的运用"];
    
    self.contengLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:12] withColor:[AppStyleConfiguration ColorWithTextTwo] withText:@"1122次学习 几何 三角函数"];

    self.moneyLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:14] withColor:[AppStyleConfiguration ColorWithMain] withText:@"¥11.2"];

    [self addSubview:self.headImgV];
    [self addSubview:self.startImgV];
    [self addSubview:self.titLab];
    [self addSubview:self.contengLab];
    [self addSubview:self.moneyLab];
}
-(void)layoutViews{
    [self.headImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.centerY.equalTo(@0);
        make.bottom.equalTo(@-7);
        make.width.mas_equalTo(self.headImgV.height*1.2);
        make.height.equalTo(@80);
       
    }];
    [self.startImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_right).offset(-50);
        make.centerY.equalTo(@0);
        make.height.equalTo(self.startImgV.mas_height);
        make.width.equalTo(self.startImgV.mas_width);
    }];

    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgV.mas_right).offset(20);
        make.top.equalTo(self.headImgV.mas_top).offset(5);
        make.height.equalTo(self.titLab.mas_height);
        make.right.equalTo(self.startImgV.mas_left).offset(-20);
       
    }];
    [self.contengLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.left.equalTo(self.titLab);
        make.height.equalTo(self.contengLab.mas_height);
        make.right.equalTo(self.titLab);
    }];
    [self.moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.headImgV.mas_bottom).offset(-5);
        make.left.equalTo(self.titLab);
        make.height.equalTo(self.moneyLab.mas_height);
        make.right.equalTo(self.titLab);
    }];


}

@end

@implementation XueXiFangFaCell0
-(void)loadViews{
    self.backgroundColor=[UIColor whiteColor];

    self.startImgV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_shoucang_wode"]];
    
    self.titLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:16] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@"数学方法解决物理问题"];
    
    self.contentLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:14] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@"\t三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数三角函数"];
    self.contentLab.numberOfLines=3;
    self.contentLab.lineSpace=2;
    
    self.timeLab=[UILabel labelWithSize:[AppStyleConfiguration appFont:12] withColor:[AppStyleConfiguration ColorWithTextThree] withText:@"2017年12月15日"];
    
    [self addSubview:self.titLab];
    [self addSubview:self.contentLab];
    [self addSubview:self.timeLab];
    [self addSubview:self.startImgV];
}
-(void)layoutViews{
    [self.titLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.top.equalTo(@15);
        make.right.equalTo(@-20);
        make.height.equalTo(self.titLab.mas_height);
    }];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.right.equalTo(@-20);
        make.top.equalTo(self.titLab.mas_bottom).offset(5);
        make.height.equalTo(self.contentLab.mas_height);
    }];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.bottom.equalTo(@-5);
        make.height.equalTo(@20);
        make.width.equalTo(self.timeLab.mas_width);
        make.top.equalTo(self.contentLab.mas_bottom).offset(12);
    }];
    [self.startImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@-20);
        make.bottom.equalTo(@-5);
        make.height.equalTo(self.startImgV.mas_height);
        make.width.equalTo(self.startImgV.mas_width);
    }];

}

@end

@implementation SearchView
-(void)loadViews{
    self.backgroundColor=[AppStyleConfiguration ColorWithBaseBoard];
    
    self.navBgView=[UIView new];
    self.navBgView.backgroundColor=[AppStyleConfiguration ColorWithMain];
    
    self.searchBgView=[UIView new];
    self.searchBgView.backgroundColor=[UIColor whiteColor];
    
    
    self.cancelBtn=[UIButton buttonWithTitle:@"取消" withTitleColor:[AppStyleConfiguration ColorWithTextOne] withSize:14 withImageName:nil withBGColor:nil];
    
    self.textTF=[UITextField new];
    self.textTF.tintColor=[AppStyleConfiguration ColorWithTextOne];
    self.textTF.textColor=[AppStyleConfiguration ColorWithTextOne];
    self.textTF.placeholder=@"请输入标签或题干";
    self.textTF.font=[AppStyleConfiguration appFont:14];
    self.textTF.returnKeyType=UIReturnKeySearch;
    
    self.headImgV=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_sousuo_shuxue"]];
    
    self.liShiBtn=[UIButton buttonWithTitle:@"  最近搜索" withTitleColor:[AppStyleConfiguration ColorWithTextOne] withSize:14 withImageName:@"ico_lishi" withBGColor:nil];
    
    self.tagView = [[SKTagView alloc] init];
    [self addSubview:self.tagView];



    
    
    [self addSubview:self.navBgView];
    [self.navBgView addSubview:self.searchBgView];
    [self.navBgView addSubview:self.cancelBtn];
    [self.searchBgView addSubview:self.textTF];
    [self.searchBgView addSubview: self.headImgV];
    [self addSubview: self.liShiBtn];
    [self addSubview: self.tagView];
}
-(void)layoutViews{
    [self.navBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(@0);
        make.height.equalTo(@(kMainTopHeight));
        
    }];
    [self.searchBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.right.equalTo(self.cancelBtn.mas_left);
        make.centerY.equalTo(self.navBgView.mas_bottom).offset(-22);
        make.height.equalTo(@35);
        ViewRadius(self.searchBgView, 5);
    }];

    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@0);
        make.centerY.equalTo(self.navBgView.mas_bottom).offset(-22);
        make.width.equalTo(@60);
        make.height.equalTo(self.cancelBtn.mas_height);
    }];

    [self.headImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.searchBgView.mas_left).offset(20);
        make.centerY.equalTo(@0);
        make.height.equalTo(self.headImgV.mas_height);
        make.width.equalTo(self.headImgV.mas_width);
      
    }];
    [self.textTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@40);
        make.right.equalTo(@-20);
        make.centerY.equalTo(@0);
        make.top.bottom.equalTo(@0);
      
    }];
    [self.liShiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@20);
        make.top.equalTo(self.navBgView.mas_bottom).offset(15);
        make.height.equalTo(@25);
        make.width.equalTo(self.liShiBtn.mas_width);
    }];
    [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.top.equalTo(self.liShiBtn.mas_bottom);
     
    }];


}


@end
