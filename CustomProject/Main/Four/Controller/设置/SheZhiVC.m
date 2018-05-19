
//
//  SheZhiVC.m
//  Zero
//
//  Created by 方涛 on 2018/4/28.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "SheZhiVC.h"
#import "FourView.h"
#import "ZhangHaoYuAnQuanVC.h"//账户与安全
#import "FeedBackVC.h"//意见反馈


@interface SheZhiVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIButton *loginOutBtn;

@end

@implementation SheZhiVC
-(UIButton *)loginOutBtn{
    if (!_loginOutBtn) {
        _loginOutBtn=[UIButton buttonWithTitle:@"退出登录" withTitleColor:[AppStyleConfiguration ColorWithTextOne] withSize:16 withImageName:nil withBGColor:[UIColor whiteColor]];
        ViewBorderRadius(_loginOutBtn, 0, 0.5, [UIColor colorWithRed:0.78f green:0.78f blue:0.80f alpha:1.00f]);
        _loginOutBtn.frame=CGRectMake(0, 10, kMainScreen_width, 50);
        [_loginOutBtn addTarget:self action:@selector(loginOutBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginOutBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle=@"设置";
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
    if (section==1) {
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
    if (section==1) {
        return 60;
    }
    return 0.01;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;//cell不被选中
    }
    cell.textLabel.font=[AppStyleConfiguration appFont:16];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.textAlignment=NSTextAlignmentLeft;
    cell.detailTextLabel.text=@"";
    if (indexPath.section==0&&indexPath.row==0) {
        cell.textLabel.text=@"账户与安全";
        
    }else if (indexPath.section==1&&indexPath.row==0) {
        cell.textLabel.text=@"意见反馈";
        
    }else if (indexPath.section==1&&indexPath.row==1) {
        cell.textLabel.text=@"关于我们";
        
    }else if (indexPath.section==1&&indexPath.row==2) {
        cell.textLabel.text=@"版本号";
        cell.accessoryType=UITableViewCellAccessoryNone;
        cell.detailTextLabel.text=@"1.0.0";
        
    }
    return cell;
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *ve=[UIView new];
    if (section==1) {
        [ve addSubview:self.loginOutBtn];
    }
    return ve;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0&&indexPath.row==0) {//账户与安全
        [self.navigationController pushViewController:[ZhangHaoYuAnQuanVC new] animated:YES];
        
    }else if (indexPath.section==1&&indexPath.row==0) {//意见反馈
        [self.navigationController pushViewController:[FeedBackVC new] animated:YES];
        
    }else if (indexPath.section==1&&indexPath.row==1) {//关于我们

        [SVProgressHUD showErrorWithStatus:@"关于我们"];
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
//退出登录
-(void)loginOutBtnClick:(UIButton*)sender{
    KPostNotification(KNotificationLoginStateChange, @NO)

}


@end


