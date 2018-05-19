//
//  ThirdView.h
//  Zero
//
//  Created by 方涛 on 2018/4/24.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "BaseView.h"
#import "BaseTableViewCell.h"
#import "SKTagView.h"

@interface ThirdView : BaseView

@end
@interface ThirdCell0 : BaseTableViewCell
@property(nonatomic,strong)UIImageView *headImgV;
@property(nonatomic,strong)UILabel *titLab;
@property(nonatomic,strong)UIImageView *contengImgV;

@end
@interface ThirdChooseView : BaseView
@property(nonatomic,strong)UIButton *nianJiBtn;//年级
@property(nonatomic,strong)UIButton *keMuBtn;//科目
@property(nonatomic,strong)UIView *line;
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIImageView *jianTouImgV;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSString *chooseType;//0 默认  1选中年级   2选中科目

@end
@interface ZhiShiDianHeadView : BaseView
@property(nonatomic,strong)UILabel *titLab;

@end
@interface ZhiShiDianCell0 : BaseTableViewCell
@property(nonatomic,strong)UIImageView *headImgV;
@property(nonatomic,strong)UIImageView *startImgV;
@property(nonatomic,strong)UILabel *titLab;
@property(nonatomic,strong)UILabel *contengLab;
@property(nonatomic,strong)UILabel *moneyLab;

@end
@interface XueXiFangFaCell0 : BaseTableViewCell
@property(nonatomic,strong)UIImageView *startImgV;
@property(nonatomic,strong)UILabel *titLab;
@property(nonatomic,strong)UILabel *contentLab;
@property(nonatomic,strong)UILabel *timeLab;

@end
@interface SearchView : BaseView
@property(nonatomic,strong)UIView *navBgView;
@property(nonatomic,strong)UIView *searchBgView;
@property(nonatomic,strong)UIButton *cancelBtn;//取消按钮
@property(nonatomic,strong)UITextField *textTF;
@property(nonatomic,strong)UIImageView *headImgV;
@property(nonatomic,strong)UIButton *liShiBtn;//历史
@property (nonatomic,strong) SKTagView *tagView;

@end
