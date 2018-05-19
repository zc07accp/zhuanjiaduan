//
//  MyTableViewCell.m
//  Zero
//
//  Created by zf on 2018/4/10.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell




-(void)loadViews
{
    self.headerImageView  =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_touxiang_wode"]];

    self.sexImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icoo_fangfa_faxian"]];

    self.nickLabel  = [UILabel labelWithSize:[UIFont systemFontOfSize:13] withColor:[UIColor blackColor] withText:@"爱吃虾"];

     self.SchoolLabel  = [UILabel labelWithSize:[UIFont systemFontOfSize:13] withColor:[UIColor colorWithRed:0.44 green:0.56 blue:0.75 alpha:1.00] withText:@"XX小学"];


     self.yearLabel  = [UILabel labelWithSize:[UIFont systemFontOfSize:13] withColor:[UIColor colorWithRed:0.44 green:0.56 blue:0.75 alpha:1.00] withText:@"三年级"];


     self.checkImagView  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_jiantou_all"]];
    self.checkImagView.hidden=YES;


    [self addSubview:self.headerImageView];

    [self addSubview:self.sexImageView];
    [self addSubview:self.nickLabel];


    [self addSubview:self.SchoolLabel];

    [self addSubview:self.yearLabel];
    [self addSubview:self.checkImagView];

    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.lineView];

}
- (void)layoutViews
{

    [self.headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(@(GTFixWidthFlaot(15)));
        make.height.width.equalTo(@(GTFixHeightFlaot(50)));

    }];


    [self.sexImageView mas_makeConstraints:^(MASConstraintMaker *make) {


        make.top.equalTo(self.headerImageView.mas_top).offset(GTFixHeightFlaot(5));
        make.left.equalTo(self.nickLabel.mas_right).offset(GTFixHeightFlaot(GTFixWidthFlaot(10)));
        make.height.width.equalTo(@(GTFixHeightFlaot(15)));
    }];




    [self.nickLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.headerImageView.mas_top).offset(GTFixHeightFlaot(5));
        make.left.equalTo(self.headerImageView.mas_right).offset(GTFixHeightFlaot(GTFixWidthFlaot(8)));
        make.height.equalTo(@(GTFixHeightFlaot(20)));
        make.width.equalTo(self.nickLabel);

    }];

    [self.SchoolLabel mas_makeConstraints:^(MASConstraintMaker *make) {


        make.bottom.equalTo(self.headerImageView.mas_bottom).offset(GTFixHeightFlaot(-5));
        make.left.equalTo(self.headerImageView.mas_right).offset(GTFixHeightFlaot(GTFixWidthFlaot(10)));
        make.height.equalTo(@(GTFixHeightFlaot(20)));
        make.width.equalTo(self.SchoolLabel);
    }];


    [self.yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {


        make.bottom.equalTo(self.headerImageView.mas_bottom).offset(GTFixHeightFlaot(-5));
        make.left.equalTo(self.SchoolLabel.mas_right).offset(GTFixHeightFlaot(GTFixWidthFlaot(20)));
        make.height.equalTo(@(GTFixHeightFlaot(20)));
        make.width.equalTo(self.yearLabel);
    }];




    [self.checkImagView mas_makeConstraints:^(MASConstraintMaker *make) {


        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(@(GTFixWidthFlaot(-15)));
        make.width.equalTo(@(GTFixWidthFlaot(10)));
        make.height.equalTo(@(GTFixWidthFlaot(14)));
    }];
    [self .lineView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(@0);
        make.left.equalTo(@0);
        make.height.equalTo(@0.5);
    }];
}
@end
@implementation MyDetailTableViewCell



-(void)loadViews
{



    self.iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_touxiang_wode"]];
    self.checkImagView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_jiantou_all"]];
    self.checkImagView.hidden=YES;

    self.TitleLabel = [UILabel labelWithSize:[UIFont systemFontOfSize:15] withColor:[UIColor blackColor] withText:@"我的老师"];




    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.lineView];



    self.lineView2 = [[UIView alloc]init];
    self.lineView2.hidden = YES;
    self.lineView2.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.lineView2];

    [self addSubview:self.iconImageView ];

    [self addSubview:self.checkImagView];

    [self addSubview:self.TitleLabel];


}
- (void)layoutViews
{


    [self.iconImageView  mas_makeConstraints:^(MASConstraintMaker *make) {


        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(@(GTFixWidthFlaot(15)));
        make.height.width.equalTo(@(GTFixHeightFlaot(20)));
    }];

    [self.TitleLabel  mas_makeConstraints:^(MASConstraintMaker *make) {


        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.iconImageView.mas_right).offset(GTFixWidthFlaot(10));
        make.height.equalTo(@(GTFixHeightFlaot(20)));
        make.width.equalTo(self.TitleLabel);
    }];

    [self.checkImagView  mas_makeConstraints:^(MASConstraintMaker *make) {


        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(@(GTFixWidthFlaot(-15)));
        make.width.equalTo(@(GTFixWidthFlaot(10)));
        make.height.equalTo(@(GTFixWidthFlaot(14)));
    }];

    [self .lineView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(@(GTFixWidthFlaot(-15)));
        make.left.equalTo(@(GTFixWidthFlaot(15)));
        make.height.equalTo(@0.5);
    }];
    [self .lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {

        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(@0);
        make.left.equalTo(@0);
        make.height.equalTo(@0.5);
    }];
}
@end
@implementation PersonalInformationCell
-(void)loadViews
{



    self.headerImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_touxiang_wode"]];
    self.checkImagView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_jiantou_all"]];

    self.TitleLabel = [UILabel labelWithSize:[UIFont systemFontOfSize:14] withColor:[UIColor blackColor] withText:@"我的老师"];

    self.ContentLable = [UILabel labelWithSize:[UIFont systemFontOfSize:14] withColor:[UIColor blackColor] withText:@"内容"];

    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.lineView];



    self.lineView2 = [[UIView alloc]init];
    self.lineView2.hidden = YES;
    self.lineView2.backgroundColor = [UIColor lightGrayColor];



    [self addSubview:self.lineView2];
    [self addSubview:self.lineView];

    [self addSubview:self.headerImageView ];

    [self addSubview:self.checkImagView];

    [self addSubview:self.TitleLabel];
    [self addSubview:self.ContentLable];

}

-(void)layoutViews
{





    [self.TitleLabel  mas_makeConstraints:^(MASConstraintMaker *make) {


        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(@(GTFixWidthFlaot(16)));
        make.height.equalTo(@(GTFixHeightFlaot(20)));
        make.width.equalTo(@(GTFixWidthFlaot(60)));
    }];




    [self.checkImagView  mas_makeConstraints:^(MASConstraintMaker *make) {


        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(@(GTFixWidthFlaot(-15)));
        make.width.equalTo(@(GTFixWidthFlaot(8)));
        make.height.equalTo(@(GTFixWidthFlaot(14)));
    }];



    [self .lineView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(@(GTFixWidthFlaot(-15)));
        make.left.equalTo(@(GTFixWidthFlaot(15)));
        make.height.equalTo(@0.5);
    }];

    [self.ContentLable  mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.checkImagView.mas_left).offset(-GTFixWidthFlaot(10));
        make.height.width.equalTo(@(GTFixHeightFlaot(25)));
    }];

    [self.headerImageView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.checkImagView.mas_left).offset(-GTFixWidthFlaot(10));
        make.height.width.equalTo(@(GTFixHeightFlaot(30)));
    }];
    [self .lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {

        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(@0);
        make.left.equalTo(@0);
        make.height.equalTo(@0.5);
    }];
}
@end

@implementation XingBieCell

-(void)loadViews
{

    self.checkImagView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_queding"]];

    self.TitleLabel = [UILabel labelWithSize:[UIFont systemFontOfSize:14] withColor:[UIColor blackColor] withText:@"我的老师"];





    self.lineView3 = [[UIView alloc]init];
    self.lineView3.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.lineView3];

    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.lineView];



    self.lineView2 = [[UIView alloc]init];
    self.lineView2.hidden = YES;
    self.lineView2.backgroundColor = [UIColor lightGrayColor];



    [self addSubview:self.checkImagView];

    [self addSubview:self.TitleLabel];
    [self addSubview:self.lineView2];
    [self addSubview:self.lineView];
}
-(void)layoutViews
{

    [self.TitleLabel  mas_makeConstraints:^(MASConstraintMaker *make) {


        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(@(GTFixWidthFlaot(16)));
        make.height.equalTo(@(GTFixHeightFlaot(20)));
        make.width.equalTo(@(GTFixWidthFlaot(60)));
    }];




    [self.checkImagView  mas_makeConstraints:^(MASConstraintMaker *make) {


        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(@(GTFixWidthFlaot(-15)));
        make.width.equalTo(@(GTFixWidthFlaot(20)));
        make.height.equalTo(@(GTFixWidthFlaot(14)));
    }];


    [self .lineView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(@(GTFixWidthFlaot(-15)));
        make.left.equalTo(@(GTFixWidthFlaot(15)));
        make.height.equalTo(@0.5);
    }];

    [self .lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.mas_top);
        make.right.equalTo(@0);
        make.left.equalTo(@0);
        make.height.equalTo(@0.2);
    }];
    [self .lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {

        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(@0);
        make.left.equalTo(@0);
        make.height.equalTo(@0.5);
    }];
}
@end


@implementation DizhiShengCell
-(void)loadViews
{



    self.checkImagView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ico_jiantou_all"]];

    self.TitleLabel = [UILabel labelWithSize:[UIFont systemFontOfSize:14] withColor:[UIColor blackColor] withText:@"浙江"];
    self.ContentLable = [UILabel labelWithSize:[UIFont systemFontOfSize:14] withColor:[UIColor colorWithRed:0.49 green:0.49 blue:0.50 alpha:1.00] withText:@"已选地区"];

    self.ContentLable.textAlignment =NSTextAlignmentRight;
    [self addSubview:self.TitleLabel];
    [self addSubview:self.checkImagView];
    [self addSubview:self.ContentLable];
}

- (void)layoutViews
{


    [self.TitleLabel  mas_makeConstraints:^(MASConstraintMaker *make) {


        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(@(GTFixWidthFlaot(16)));
        make.height.equalTo(@(GTFixHeightFlaot(20)));
        make.width.equalTo(@(GTFixWidthFlaot(60)));
    }];




    [self.checkImagView  mas_makeConstraints:^(MASConstraintMaker *make) {


        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(@(GTFixWidthFlaot(-15)));
        make.width.equalTo(@(GTFixWidthFlaot(8)));
        make.height.equalTo(@(GTFixWidthFlaot(13)));
    }];

    [self.ContentLable  mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.checkImagView.mas_left).offset(-GTFixWidthFlaot(10));
        make.height.equalTo(@(GTFixHeightFlaot(25)));
        make.width.equalTo(@(GTFixWidthFlaot(90)));
    }];
}
@end


@implementation DizhiShengYiXuanZeCell

-(void)loadViews
{
    self.checkImagView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dingwei"]];

    self.TitleLabel = [UILabel labelWithSize:[UIFont systemFontOfSize:14] withColor:[UIColor blackColor] withText:@"浙江"];

    [self addSubview:self.TitleLabel];
    [self addSubview:self.checkImagView];
}
-(void)layoutViews
{


    [self.checkImagView  mas_makeConstraints:^(MASConstraintMaker *make) {


        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(@(GTFixWidthFlaot(15)));
        make.width.equalTo(@(GTFixWidthFlaot(13)));
        make.height.equalTo(@(GTFixWidthFlaot(13)));
    }];

    [self.TitleLabel  mas_makeConstraints:^(MASConstraintMaker *make) {


        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.checkImagView.mas_right).offset(5);
        make.height.equalTo(@(GTFixHeightFlaot(20)));
        make.width.equalTo(@(GTFixWidthFlaot(90)));
    }];

}
@end




