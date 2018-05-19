//
//  HomeView.h
//  Zero
//
//  Created by 方涛 on 2018/4/24.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "BaseView.h"
#import "BaseTableViewCell.h"

@interface HomeView : BaseView
@property(nonatomic,strong)UIImageView *iconImgV0;//讨厌别戳我
@property(nonatomic,strong)UIImageView *iconImgV1;//零错题，学习更胜一筹
@property(nonatomic,strong)UIImageView *paiZhao;//拍照
@property(nonatomic,strong)UIButton *setTextBtn;//文字输入按钮
@property(nonatomic,strong)UIImageView *bottomImgV;//讨厌别戳我


@end
@interface WenZiLuTiView : BaseView
@property(nonatomic,strong)UITextView *titleTextV;//
@property(nonatomic,strong)UITextView *contentTextV;//
@property(nonatomic,strong)UILabel *titLab;//
@property(nonatomic,strong)UILabel *contentLab;//

@end
@interface BeiZhuXingXiView : BaseView
@property(nonatomic,strong)UITextView *TextV;//
@property(nonatomic,strong)UILabel *titLab;//
@property(nonatomic,strong)UIButton *sureBtn;//

@end
@interface XiangQingChooseView : BaseView
@property(nonatomic,strong)UIButton *neiRongBtn;//
@property(nonatomic,strong)UIButton *biaoQianBtn;//
@property(nonatomic,strong)UIView *bgView;
@property(nonatomic,strong)UIView *line0;
@property(nonatomic,assign)BOOL isBiaoQian;//是否选中标签

@end
@interface XiangQingThreeBtnView : BaseView
@property(nonatomic,strong)UIButton *buChongBtn;//
@property(nonatomic,strong)UIButton *zhengJieBtn;//
@property(nonatomic,strong)UIButton *beiZhuBtn;//
@end

@interface CuoTiNeiRongCell0 : BaseTableViewCell
@property(nonatomic,strong)UIImageView *imgV;//

@end
@interface CuoTiNeiRongHeadView : BaseView
@property(nonatomic,strong)UILabel *titLab;//

@end
@interface BiaoQianShuRuKuang : BaseView
@property(nonatomic,strong)UIView *bgView;//
@property(nonatomic,strong)UILabel *titLab;//
@property(nonatomic,strong)UITextField *textTF;//
@property(nonatomic,strong)UIButton *cancelBtn;//
@property(nonatomic,strong)UIButton *sureBtn;//
@end
@interface LuTiChengGongView : BaseView
@property(nonatomic,strong)UIImageView *headImgV;//
@property(nonatomic,strong)UILabel *titLab;//
@property(nonatomic,strong)UIButton *jieSuBtn;//
@property(nonatomic,strong)UIButton *jiXuBtn;//
@end
