

//
//  XueXiFangFaVC.m
//  Zero
//
//  Created by 方涛 on 2018/4/24.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "XueXiFangFaVC.h"
#import "ThirdView.h"
#import "SearchVC.h"

@interface XueXiFangFaVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)ThirdChooseView *mainV;


@end

@implementation XueXiFangFaVC
-(ThirdChooseView *)mainV{
    if (!_mainV) {
        _mainV=[[ThirdChooseView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height-kMainTopHeight)];
        _mainV.tableView.delegate=self;
        _mainV.tableView.dataSource=self;
        [_mainV.tableView registerClass:[XueXiFangFaCell0 class] forCellReuseIdentifier:@"XueXiFangFaCell0"];
        _mainV.tableView.estimatedRowHeight=80;
        _mainV.tableView.separatorColor=[AppStyleConfiguration ColorWithBaseBoard];
        [_mainV.nianJiBtn addTarget:self action:@selector(nianJiBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_mainV.keMuBtn addTarget:self action:@selector(keMuBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _mainV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle=@"学习方法";
    self.navRightBtnImg=@"ico_sousuo";
    [self.view addSubview:self.mainV];
}
-(void)right_button_event:(UIButton *)sender{
    [self.navigationController pushViewController:[SearchVC new] animated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 50;
//}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XueXiFangFaCell0 *cell=[tableView dequeueReusableCellWithIdentifier:@"XueXiFangFaCell0"];
    
    return cell;
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [UIView new];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(void)nianJiBtnClick:(UIButton*)sender{
    if (sender.selected==YES) {
        self.mainV.chooseType=@"0";
    }else{
        self.mainV.chooseType=@"1";
    }
}
-(void)keMuBtnClick:(UIButton*)sender{
    if (sender.selected==YES) {
        self.mainV.chooseType=@"0";
        
    }else{
        self.mainV.chooseType=@"2";
        
    }
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

