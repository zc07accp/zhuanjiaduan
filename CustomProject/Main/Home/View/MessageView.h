//
//  MessageView.h
//  CustomProject
//
//  Created by fei du on 2017/5/11.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "BaseView.h"
#import "BaseTableViewCell.h"
@interface MessageView : BaseView

@end

@interface MessageTableViewCell : BaseTableViewCell

@property (nonatomic, strong) UIImageView *iconImgV;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *numLabel;
@property (nonatomic, strong) UIImageView *tailImgV;
@property (nonatomic, strong) UIView *lineView;

@end

@interface MessageInfoTableViewCell : BaseTableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *infoLabel;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIImageView *kindImgV;
@property (nonatomic, strong) UIView *bgView;

@end
//消息详情列表cell
@interface MessageDelCell : BaseTableViewCell


@property (nonatomic,strong)UIView     *backview;
@property (nonatomic,strong)UILabel         *time;
@property (nonatomic,strong)UILabel         *title;
@property (nonatomic,strong)UILabel         *neitong;
@property (nonatomic,strong)UILabel         *riqiLabel;
@property (nonatomic, strong) UIImageView* weidu;

-(void)setMessageDelCell :(id)model;

@end
