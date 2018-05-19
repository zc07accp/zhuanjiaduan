//
//  BaseTableViewContronller.h
//  CustomProject
//
//  Created by mozhu on 2017/9/28.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseUtils.h"
@interface BaseTableViewContronller : BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *listArr;

@property(nonatomic,assign)NSInteger page;
@property(nonatomic,strong)NSString *next;


@property(nonatomic,assign)BOOL netWorkState;
//head and foot 隐藏显示状态
@property(nonatomic,assign)BOOL hasHeadAndfoot;
@property(nonatomic,assign)BOOL hasHead;
@property(nonatomic,assign)BOOL hasFoot;

//加载视图状态和结果状态 
@property (nonatomic, assign)BOOL loading;
@property (nonatomic, assign)BOOL allowSroll;
@property (nonatomic, assign) CGFloat offset;
@property (nonatomic, strong) UIColor  *backColor;
@property (nonatomic, strong) NSString *emptyText;
@property (nonatomic, strong) NSString *loadImage;
@property (nonatomic, strong) NSString *emptyImage;
@property (nonatomic, strong) NSString *errorEmptyImage;
@property(nonatomic,assign)BOOL showEmpty;

-(void)loadData;
-(void)headerFooterHidden;
@end
