//
//  FourView.h
//  Zero
//
//  Created by 方涛 on 2018/4/25.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "BaseView.h"
#import "BaseTableViewCell.h"
#import "FTLabel.h"
#import "SKTagView.h"
#import "FTTextFiled.h"

@interface FourView : BaseView

@end
@interface WoDeShouCangView : BaseView
@property(nonatomic,strong)UIButton *xueXiFangFaBtn;//学习方法
@property(nonatomic,strong)UIButton *zhiShiDianBtn;//知识点
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIView *line;
@property(nonatomic,strong)UIView *line0;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,assign)BOOL isZhiShiDian;//是否选中知识点
@end
@interface MyTeacherCell0 : BaseTableViewCell
@property(nonatomic,strong)UIImageView *headImgV;//学习方法
@property(nonatomic,strong)UILabel *titLab;//学科类别
@property(nonatomic,strong)UILabel *nameLab;//姓名
@property(nonatomic,strong)UIButton *jieBangBtn;//解绑

@end
@interface JiaTingZuoYeCell0 : BaseTableViewCell
@property(nonatomic,strong)UIImageView *headImgV;//学习方法
@property(nonatomic,strong)FTLabel *numLab;//数量
@property(nonatomic,strong)UILabel *titLab;//名

@end
@interface ShaiXuanHeadView : BaseView
@property(nonatomic,strong)UILabel *titLab;

@end
@protocol VIPHUiYuanViewDelegate <NSObject>

-(void)selectDayWithLab:(UILabel*)lab;
@end
@interface VIPHUiYuanView : BaseView<VIPHUiYuanViewDelegate>
@property(nonatomic,strong)UILabel *titLab;
@property(nonatomic,strong)UILabel *dayLab;
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIView *contentV;
@property(nonatomic,strong)UILabel *moneyLab;
@property(nonatomic,strong)UIButton *zhiFuBaoBtn;
@property(nonatomic,strong)UIButton *weiXinBtn;

@end
@interface ChangeCellView : BaseView

@property(nonatomic,strong)FTTextFiled *phoneTF;
@property(nonatomic,strong)FTTextFiled *codeTF;
@property(nonatomic,strong)UIButton *sureBtn;


@end
@interface YiBangDingView : BaseView

@property(nonatomic,strong)UIImageView *headImgV;
@property(nonatomic,strong)UILabel *titLab;
@property(nonatomic,strong)UILabel *cellLab;
@property(nonatomic,strong)UILabel *contengLab;
@property(nonatomic,strong)UIButton *sureBtn;


@end

@interface BangDingZhiFubaoCell0 : BaseTableViewCell
@property(nonatomic,strong)UILabel *titLab;
@property(nonatomic,strong)UITextField *textTF;
@property(nonatomic,strong)UIButton *codeBtn;

@end
@interface ChongZhiPwdView : BaseView
@property(nonatomic,strong)FTTextFiled *oldPwd;
@property(nonatomic,strong)FTTextFiled *xinPwd;
@property(nonatomic,strong)UIButton *sureBtn;
@end
