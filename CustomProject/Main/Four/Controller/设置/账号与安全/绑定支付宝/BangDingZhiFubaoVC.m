
//
//  BangDingZhiFubaoVC.m
//  Zero
//
//  Created by 方涛 on 2018/4/28.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "BangDingZhiFubaoVC.h"
#import "FourView.h"
#import "UIButton+CountDown.h"

@interface BangDingZhiFubaoVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIButton *sureBtn;

@end

@implementation BangDingZhiFubaoVC
-(UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn=[UIButton buttonWithTitle:@"确定" withTitleColor:[AppStyleConfiguration ColorWithTextOne] withSize:16 withImageName:nil withBGColor:[AppStyleConfiguration ColorWithMain]];
        _sureBtn.frame=CGRectMake(20, 60, kMainScreen_width-40, 40);
        [_sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _sureBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle=@"绑定支付宝";
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
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0: return 2;
        case 1: return 1;
        case 2: return 2;
        default: break;
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
    BangDingZhiFubaoCell0 *cell=[tableView dequeueReusableCellWithIdentifier:@"BangDingZhiFubaoCell0"];
    if (!cell) {
        cell=[[BangDingZhiFubaoCell0 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BangDingZhiFubaoCell0"];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;//cell不被选中
    }
    cell.codeBtn.hidden=YES;
    if (indexPath.section==0&&indexPath.row==0) {
        cell.titLab.text=@"姓名";
        cell.textTF.placeholder=@"请输入您的真实姓名";
        
    }else if (indexPath.section==0&&indexPath.row==1) {
        cell.titLab.text=@"身份证号";
        cell.textTF.placeholder=@"请输入您的身份证号";
        
    }else if (indexPath.section==1&&indexPath.row==0) {
        cell.titLab.text=@"支付宝账号";
        cell.textTF.placeholder=@"请输入您的支付宝账号";
        
    }else if (indexPath.section==2&&indexPath.row==0) {
        cell.titLab.text=@"手机号码";
        cell.textTF.placeholder=@"请输入您的手机号码";
        
    }else if (indexPath.section==2&&indexPath.row==1) {
        cell.titLab.text=@"验证码";
        cell.textTF.placeholder=@"请输入验证码";
        cell.codeBtn.hidden=NO;//
        [cell.codeBtn addTarget:self action:@selector(codeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cell;
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *ve=[UIView new];
    if (section==2) {
        [ve addSubview:self.sureBtn];
    }
    return ve;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
-(void)codeBtnClick:(UIButton*)sender{
    [sender FTstartTime:60 title:@"重新获取" waitTittle:@"秒后重发" enableColor:[UIColor clearColor] startColor:[UIColor clearColor]];

}
-(void)sureBtnClick:(UIButton*)sender{
    
}
@end
