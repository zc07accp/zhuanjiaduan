
//
//  WoDeShouCangVC.m
//  Zero
//
//  Created by 方涛 on 2018/4/25.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "WoDeShouCangVC.h"
#import "FourView.h"
#import "ThirdView.h"

@interface WoDeShouCangVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)WoDeShouCangView *mainV;

@end

@implementation WoDeShouCangVC
-(WoDeShouCangView *)mainV{
    if (!_mainV) {
        _mainV=[[WoDeShouCangView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height-kMainTopHeight)];
        _mainV.tableView.delegate=self;
        _mainV.tableView.dataSource=self;
        [_mainV.tableView registerClass:[ZhiShiDianCell0 class] forCellReuseIdentifier:@"ZhiShiDianCell0"];
        [_mainV.tableView registerClass:[XueXiFangFaCell0 class] forCellReuseIdentifier:@"XueXiFangFaCell0"];
        _mainV.tableView.estimatedRowHeight=80;
        
        [_mainV.xueXiFangFaBtn addTarget:self action:@selector(xueXiFangFaBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_mainV.zhiShiDianBtn addTarget:self action:@selector(zhiShiDianBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mainV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle=@"我的收藏";
    [self.view addSubview:self.mainV];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.mainV.isZhiShiDian) {
        return 30;
    }
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.mainV.isZhiShiDian) {
        ZhiShiDianCell0 *cell=[tableView dequeueReusableCellWithIdentifier:@"ZhiShiDianCell0"];
        cell.startImgV.hidden=YES;
        return cell;
    }
    XueXiFangFaCell0 *cell=[tableView dequeueReusableCellWithIdentifier:@"XueXiFangFaCell0"];
    cell.startImgV.hidden=YES;

    return cell;
   
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (self.mainV.isZhiShiDian) {
        ZhiShiDianHeadView *headV=[[ZhiShiDianHeadView alloc]initWithFrame:CGRectMake(0, 0, kMainScreen_width, 30)];
        headV.titLab.text=@"共找到194门课程";
        return headV;
    }
    return [UIView new];
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [UIView new];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(void)xueXiFangFaBtnClick:(UIButton*)sender{
    self.mainV.isZhiShiDian=NO;
    self.mainV.tableView.separatorColor=[AppStyleConfiguration ColorWithBaseBoard];
    [self.mainV.tableView reloadData];
}
-(void)zhiShiDianBtnClick:(UIButton*)sender{
    self.mainV.isZhiShiDian=YES;
    self.mainV.tableView.separatorColor=[UIColor whiteColor];

    [self.mainV.tableView reloadData];

}
-(void)viewDidLayoutSubviews {
    
    if ([self.mainV.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.mainV.tableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([self.mainV.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.mainV.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}


@end
