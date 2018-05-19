//
//  MyTableViewCell.h
//  Zero
//
//  Created by zf on 2018/4/10.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface MyTableViewCell : BaseTableViewCell

@property (nonatomic, strong) UIImageView  *headerImageView;
@property (nonatomic, strong) UIImageView *sexImageView;
@property (nonatomic, strong) UILabel *nickLabel;
@property (nonatomic, strong) UILabel *SchoolLabel;
@property (nonatomic, strong) UILabel *yearLabel;
@property (nonatomic, strong) UIImageView *checkImagView;
@property (nonatomic, strong) UIView *lineView;

@end

@interface  MyDetailTableViewCell :BaseTableViewCell


@property (nonatomic, strong) UIImageView  *iconImageView;
@property (nonatomic, strong) UIImageView *NewImageView;
@property (nonatomic, strong) UILabel *TitleLabel;

@property (nonatomic, strong) UIImageView *checkImagView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *lineView2;

@end



@interface  PersonalInformationCell :BaseTableViewCell


@property (nonatomic, strong) UILabel *TitleLabel;
@property (nonatomic, strong) UILabel *ContentLable;
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UIImageView *checkImagView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *lineView2;

@end

@interface XingBieCell:BaseTableViewCell
@property (nonatomic, strong) UILabel *TitleLabel;
@property (nonatomic, strong) UIImageView *checkImagView;
@property (nonatomic, strong) UIView *lineView3;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *lineView2;
@property (nonatomic, assign) BOOL Sel;
@end


@interface DizhiShengCell:BaseTableViewCell
@property (nonatomic, strong) UILabel *TitleLabel;
@property (nonatomic, strong) UIImageView *checkImagView;
@property (nonatomic, strong) UILabel *ContentLable;
@end




@interface DizhiShengYiXuanZeCell:BaseTableViewCell
@property (nonatomic, strong) UILabel *TitleLabel;
@property (nonatomic, strong) UIImageView *checkImagView;
@end
