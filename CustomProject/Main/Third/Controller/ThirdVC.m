//
//  ThirdVC.m
//  CustomProject
//
//  Created by mozhu on 17/3/9.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "ThirdVC.h"
#import "ThirdView.h"
#import "ZhiShiDianVC.h"
#import "XueXiFangFaVC.h"



@interface ThirdVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation ThirdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navTitle=@"发现";
    [self.view addSubview:self.tableView];
}
#pragma mark tableView 代理方法
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, kMainTopHeight , kMainScreen_width, kMainScreen_height-kMainBottomHeight-kMainTopHeight) style:UITableViewStyleGrouped];;
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor=[AppStyleConfiguration ColorWithBaseBoard];
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
        return 1;
    }
    return 2;
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
    ThirdCell0 *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[ThirdCell0 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;//cell不被选中
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.contengImgV.hidden=YES;
    if (indexPath.section==0&&indexPath.row==0) {
        cell.contengImgV.hidden=NO;
        cell.titLab.text=@"错题悬赏";
        cell.headImgV.image=[UIImage imageNamed:@"ico_xuanshang_faxian"];

    }else if (indexPath.section==1&&indexPath.row==0) {
        cell.titLab.text=@"知识点视频";
        cell.headImgV.image=[UIImage imageNamed:@"ico_shipin_faxian"];
    }else if (indexPath.section==1&&indexPath.row==1) {
        cell.titLab.text=@"学习方法";
        cell.headImgV.image=[UIImage imageNamed:@"icoo_fangfa_faxian"];
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
    if (indexPath.section==1&&indexPath.row==0) {//知识点视频
        [self.navigationController pushViewController:[ZhiShiDianVC new] animated:YES];
        
    }if (indexPath.section==1&&indexPath.row==1) {//学习方法
        [self.navigationController pushViewController:[XueXiFangFaVC new] animated:YES];
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
