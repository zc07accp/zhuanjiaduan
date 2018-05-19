//
//  NavSearchView.m
//  CustomProject
//
//  Created by mozhu on 17/4/7.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "NavSearchView.h"

#import "UIButoon+Style.h"
@implementation NavTextFieldSearchView

-(void)loadViews
{
    self.searchImg=[UIImageView imageViewWithFrame:CGRectMake(10, 7.5, 15, 15) imageName:@"icon_fangdajing"];
    [self addSubview:self.searchImg];
    
    self.textField=[[UITextField alloc]init];
    self.textField.placeholder=@"搜索品牌/商品";
    self.textField.font=[UIFont systemFontOfSize:13];
    self.textField.textColor=[UIColor whiteColor];
    [self.textField setValue:[AppStyleConfiguration ColorWithTextThree] forKeyPath:@"_placeholderLabel.textColor"];
    [self addSubview:self.textField];
    
    self.backgroundColor=[UIColor colorWithRed:0.99f green:0.99f blue:0.99f alpha:1.00f];
    self.layer.masksToBounds=YES;
    self.layer.borderWidth=0.8;
    self.layer.borderColor=[AppStyleConfiguration ColorWithLineColor].CGColor;
    self.layer.cornerRadius=GTFixWidthFlaot(15);
}
-(void)layoutViews
{
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(35);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(30);
    }];
}
@end

@implementation NavSearchView

-(void)loadViews
{
    self.navView=[UIView viewWithFrame:CGRectMake(0, 0, kMainScreen_width, kMainTopHeight) withbackGroudColor:[UIColor clearColor]];
    [self addSubview:self.navView];
    
    self.qiandaoBtn=[UIButton buttonWithTitle:@"" withImageName:@"icon_qiandao" withBGColor:nil Withlayer:NO];
    [self.qiandaoBtn setImageEdgeInsets:UIEdgeInsetsMake(-10, 0, 0, 0)];
    [self.navView addSubview:self.qiandaoBtn];
    
    UILabel *qiandaoLabel=[UILabel labelWithSize:KFont(10) withColor:[AppStyleConfiguration ColorWithTextTwo] withText:@"签到"];
    qiandaoLabel.frame=CGRectMake(0, 22, 28, 10);
    qiandaoLabel.textAlignment=NSTextAlignmentCenter;
    [self.qiandaoBtn addSubview:qiandaoLabel];
    
    self.sortBtn=[UIButton buttonWithTitle:@"" withImageName:@"icon_feilei" withBGColor:nil Withlayer:NO];
    [self.sortBtn setImageEdgeInsets:UIEdgeInsetsMake(-10, 0, 0, 0)];
    [self.navView addSubview:self.sortBtn];
    
    UILabel *sortLabel=[UILabel labelWithSize:KFont(10) withColor:[AppStyleConfiguration ColorWithTextTwo] withText:@"分类"];
    sortLabel.frame=CGRectMake(0, 22, 28, 10);
    sortLabel.textAlignment=NSTextAlignmentCenter;
    [self.sortBtn addSubview:sortLabel];
    
    self.messageBtn=[UIButton buttonWithTitle:@"" withImageName:@"icon_feilei" withBGColor:nil Withlayer:NO];
    [self.messageBtn setImageEdgeInsets:UIEdgeInsetsMake(-10, 0, 0, 0)];
    [self.navView addSubview:self.messageBtn];
    
    UILabel *messageLabel=[UILabel labelWithSize:KFont(10) withColor:[AppStyleConfiguration ColorWithTextTwo] withText:@"消息"];
    messageLabel.frame=CGRectMake(0, 22, 28, 10);
    messageLabel.textAlignment=NSTextAlignmentCenter;
    [self.messageBtn addSubview:messageLabel];
    
    self.searchTextField=[[NavTextFieldSearchView alloc]init];
    self.searchTextField.textField.enabled=NO;
    [self.navView addSubview:self.searchTextField];
    
    UIView *lineView=[UIView viewWithFrame:CGRectMake(0, kMainTopHeight-0.8, kMainScreen_width, 0.8) withbackGroudColor:[AppStyleConfiguration ColorWithLineColor]];
    [self.navView addSubview:lineView];
}

-(void)layoutViews
{
    [self.qiandaoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(kMainTopHeight-40);
        make.width.mas_equalTo(28);
        make.height.mas_equalTo(32);
    }];
    [self.searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.qiandaoBtn.mas_right).offset(5);
        make.top.mas_equalTo(kMainTopHeight-38);
        make.right.mas_equalTo(-75);
        make.height.mas_equalTo(30);
    }];
    [self.sortBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.searchTextField.mas_right).offset(10);
        make.top.equalTo(self.searchTextField.mas_top).offset(-2);
        make.width.mas_equalTo(28);
        make.height.mas_equalTo(32);
    }];
    [self.messageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sortBtn.mas_right).offset(5);
        make.top.equalTo(self.searchTextField.mas_top).offset(-2);
        make.width.mas_equalTo(28);
        make.height.mas_equalTo(32);
    }];
    
}

@end
