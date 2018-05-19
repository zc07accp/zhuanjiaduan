
//
//  ZhangHaoYuAnQuanVC.m
//  Zero
//
//  Created by 方涛 on 2018/4/28.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "ZhangHaoYuAnQuanVC.h"
#import "FourView.h"
#import "ChangeCellVC.h"//更换手机号
#import "YiBangDingCellVC.h"//已绑定手机号
#import "BangDingZhiFubaoVC.h"//绑定支付宝
#import "ChongZhiPwdVC.h"//重置密码

@interface ZhangHaoYuAnQuanVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ZhangHaoYuAnQuanVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle=@"账户与安全";
    [self tableView];
}
#pragma mark tableView 代理方法
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height-kMainTopHeight) style:UITableViewStyleGrouped];;
        _tableView.delegate=self;
        _tableView.dataSource=self;
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 3;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;//cell不被选中
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section==0&&indexPath.row==0) {
        cell.textLabel.text=@"绑定手机";
    }else if (indexPath.section==0&&indexPath.row==1) {
        cell.textLabel.text=@"绑定微信";
    }else if (indexPath.section==0&&indexPath.row==2) {
        cell.textLabel.text=@"绑定支付宝";
    }else if (indexPath.section==1&&indexPath.row==0) {
        cell.textLabel.text=@"修改密码";
    }
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
    if (indexPath.section==0&&indexPath.row==0) {//绑定手机
        [self.navigationController pushViewController:[YiBangDingCellVC new] animated:YES];
        
    }else if (indexPath.section==0&&indexPath.row==1) {//绑定微信
        KPostNotification(KNotificationLoginStateChange, @NO)
        
    }else if (indexPath.section==0&&indexPath.row==2) {//绑定支付宝
        [self.navigationController pushViewController:[BangDingZhiFubaoVC new] animated:YES];
        
    }else if (indexPath.section==1&&indexPath.row==0) {//修改密码
        [self.navigationController pushViewController:[ChongZhiPwdVC new] animated:YES];
    }
    
}
-(void)viewDidLayoutSubviews {
    
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
        
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)])  {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
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

