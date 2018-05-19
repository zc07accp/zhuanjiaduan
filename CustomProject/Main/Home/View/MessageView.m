//
//  MessageView.m
//  CustomProject
//
//  Created by fei du on 2017/5/11.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "MessageView.h"


@implementation MessageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end


@implementation MessageTableViewCell

- (void)loadViews {
    [self.contentView addSubview:self.iconImgV];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.numLabel];
    [self.contentView addSubview:self.tailImgV];
    [self.contentView addSubview:self.lineView];
}

- (void)loadDataWithModel:(id)model withIndexPath:(NSIndexPath *)indexPath {
    kWeakSelf(self);
    [self.iconImgV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(GTFixWidthFlaot(15)));
        make.top.equalTo(@10);
        make.bottom.equalTo(@(-10));
        make.width.equalTo(weakself.iconImgV.mas_width);
        make.height.equalTo(weakself.iconImgV.mas_height);
    }];
    
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.iconImgV.mas_right).offset(10);
        make.top.bottom.equalTo(@0);
    }];
    
    [self.tailImgV mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@(-GTFixWidthFlaot(15)));
        make.centerY.equalTo(@0);
        make.width.equalTo(weakself.tailImgV.mas_width);
        make.height.equalTo(weakself.tailImgV.mas_height);
    }];
    
    [self.numLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakself.tailImgV.mas_left).offset(-10);
        make.centerY.equalTo(@0);
        make.width.equalTo(weakself.numLabel.mas_width);
        make.height.equalTo(@15);
       self.numLabel.layer.masksToBounds=YES;
        self.numLabel.layer.cornerRadius=7.5;
    }];
    
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakself.titleLabel);
        make.right.bottom.equalTo(@0);
        make.height.equalTo(@1);
    }];
}

- (UIImageView *)iconImgV {
    if (!_iconImgV) {
        _iconImgV = [[UIImageView alloc]init];
    }
    return _iconImgV;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel labelWithSize:[AppStyleConfiguration FontWith16] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@""];
    }
    return _titleLabel;
}

- (UILabel *)numLabel {
    if (!_numLabel) {
        _numLabel=[UILabel labelWithSize:[UIFont systemFontOfSize:12] withColor:[UIColor blackColor] withText:@"21条"];
        _numLabel.textAlignment = NSTextAlignmentCenter;
        _numLabel.backgroundColor=[AppStyleConfiguration ColorWithBottomTabBarSelectColor];
        _numLabel.textColor=[UIColor whiteColor];

    }
    return _numLabel;
}

- (UIImageView *)tailImgV {
    if (!_tailImgV) {
        _tailImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_jinru"]];
    }
    return _tailImgV;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [AppStyleConfiguration ColorWithLineColor];
    }
    return _lineView;
}


@end

@implementation MessageInfoTableViewCell

- (void)loadViews {
//    [self.contentView addSubview:self.titleLabel];
//    [self.contentView addSubview:self.lineView];
    self.backgroundColor = [UIColor clearColor];
    self.bgView = [[UIView alloc]init];
    [self addSubview:self.bgView];
    self.bgView.backgroundColor = [UIColor whiteColor];


    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(GTFixWidthFlaot(10)));
        make.right.equalTo(@(-GTFixWidthFlaot(10)));
        make.top.equalTo(@(GTFixHeightFlaot(0)));
        make.bottom.equalTo(@(-10));
    }];

    self.bgView.layer.cornerRadius = 10;

    [self.bgView addSubview:self.infoLabel];
}

- (void)loadDataWithModel:(id)model withIndexPath:(NSIndexPath *)indexPath {
    [self.infoLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(GTFixWidthFlaot(0)));
        make.right.equalTo(@(-GTFixWidthFlaot(0)));
        make.top.equalTo(@(GTFixHeightFlaot(0)));
        make.bottom.equalTo(@(0));
    }];

}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel labelWithSize:[AppStyleConfiguration FontWith18] withColor:[AppStyleConfiguration ColorWithTextOne] withText:@""];
    }

    return _titleLabel;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [UILabel labelWithSize:[AppStyleConfiguration FontWith14] withColor:[AppStyleConfiguration ColorWithTextTwo] withText:@""];
        _infoLabel.numberOfLines = 2;
    }
    return _infoLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [AppStyleConfiguration ColorWithLineColor];
    }
    return _lineView;
}

- (UIImageView *)kindImgV {
    if (!_kindImgV) {
        _kindImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_xiaosanjiao"]];
    }
    return _kindImgV;
}

@end

@implementation MessageDelCell

-(void)loadViews{
    self.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.96 alpha:1.00];
    self.backview = [[UIView alloc]init];

    self.time = [UILabel labelWithSize:[UIFont systemFontOfSize:(GTFixWidthFlaot(12))] withColor:[UIColor grayColor] withText:@"1"];

    self.title = [UILabel labelWithSize:[UIFont systemFontOfSize:(GTFixWidthFlaot(14))] withColor:[UIColor blackColor] withText:@"1"];


    self.riqiLabel = [UILabel labelWithSize:[UIFont systemFontOfSize:(GTFixWidthFlaot(10))] withColor:[UIColor grayColor] withText:@"1"];

    self.neitong = [UILabel labelWithSize:[UIFont systemFontOfSize:(GTFixWidthFlaot(12))] withColor:[UIColor blackColor] withText:@"1"];


    self.neitong.numberOfLines = 0;

    self.time.backgroundColor = [UIColor whiteColor];
    self.time.layer.cornerRadius= GTFixHeightFlaot(5);
    self.time.layer.masksToBounds = YES;
    self.time.textAlignment = NSTextAlignmentCenter;

    self.backview.backgroundColor = [UIColor whiteColor];
    self.backview.layer.cornerRadius = 5;
    self.time.textAlignment = NSTextAlignmentCenter;
    self.title.textAlignment = NSTextAlignmentLeft;


    self.weidu = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_weidu"]];

    [self.backview addSubview:self.weidu];

    [self addSubview:self.backview];
    [self addSubview:self.time];
    [self.backview addSubview:self.title];
    [self.backview addSubview:self.riqiLabel];
    [self.backview addSubview:self.neitong];


}
-(void)layoutViews{

    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(GTFixWidthFlaot(20)));
        make.centerX.equalTo(self.mas_centerX);
        make.height.equalTo(@(GTFixHeightFlaot(20)));
        make.width.equalTo(self.time);
    }];

    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(@(GTFixWidthFlaot(10)));
        make.left.equalTo(@(GTFixWidthFlaot(5)));
        make.right.equalTo(@(GTFixWidthFlaot(-5)));
        make.height.equalTo(@(GTFixHeightFlaot(20)));
    }];


    [self.riqiLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(self.title.mas_bottom).offset(GTFixHeightFlaot(5));
        make.left.equalTo(@(GTFixWidthFlaot(5)));
        make.right.equalTo(@(GTFixWidthFlaot(-5)));
        make.height.equalTo(@(GTFixHeightFlaot(15)));
    }];
    [self.neitong mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.riqiLabel.mas_bottom).offset(GTFixHeightFlaot(5));
        make.left.equalTo(@(GTFixWidthFlaot(5)));
        make.right.equalTo(@(GTFixWidthFlaot(-5)));
    }];

    [self.weidu mas_makeConstraints:^(MASConstraintMaker *make) {

         make.top.equalTo(@(GTFixWidthFlaot(10)));
        make.right.equalTo(@(GTFixWidthFlaot(-15)));
        make.height.equalTo(@(GTFixHeightFlaot(9)));
        make.width.equalTo(@(GTFixWidthFlaot(30)));
    }];
    [self.backview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.time.mas_bottom).offset(GTFixHeightFlaot(5));
        make.left.equalTo(@(GTFixWidthFlaot(10)));
        make.right.equalTo(@(GTFixWidthFlaot(-10)));
        make.bottom.equalTo(@(0));
    }];

}

-(void)setMessageDelCell :(id )model{
}

@end

