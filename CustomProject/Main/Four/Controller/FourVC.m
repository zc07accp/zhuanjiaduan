//
//  FourVC.m
//  CustomProject
//
//  Created by mozhu on 17/3/9.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "FourVC.h"
#import "MyTableViewCell.h"
#import "PersonalinformationVC.h"
#import "WoDeShouCangVC.h"//我的收藏
#import "MyTeacherVC.h"//我的老师
#import "JiaTingZuoYeVC.h"//我的家庭作业
#import "TiKuFuXiVC.h"//题库复习
#import "SheZhiVC.h"//设置
#import "VIPHuiYuanVC.h"//VIP信息

@interface FourVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray * OneIconArray;
@property (nonatomic, strong) NSArray *OneTitleArray;


@property (nonatomic, strong) NSArray * ThreeIconArray;
@property (nonatomic, strong) NSArray *threeTitleArray;



@end

@implementation FourVC



-(NSArray *)OneIconArray
{
    if (!_OneIconArray)
    {
        _OneIconArray = [NSArray arrayWithObjects:@"ico_laoshi_wode",@"ico_zuoye_wode",@"ico_fuxi_xinshou",@"ico_shoucang_wode", nil];
    }
    return _OneIconArray;
}
-(NSArray *)OneTitleArray
{
    if (!_OneTitleArray)
    {
        _OneTitleArray = [NSArray arrayWithObjects:@"我的老师",@"我的家庭作业",@"题库复习",@"我的收藏", nil];
    }
    return _OneTitleArray;
}

-(NSArray *)threeTitleArray
{

    if (!_threeTitleArray)
    {
        _threeTitleArray = [NSArray arrayWithObjects:@" VIP 信息",@"积分兑换礼品", nil];
    }
    return _threeTitleArray;
}

-(NSArray *)ThreeIconArray
{

    if (!_ThreeIconArray)
    {
        _ThreeIconArray = [NSArray arrayWithObjects:@"ico_vip_wode",@"ico_jifen_wode", nil];
    }
    return _ThreeIconArray;
}

-(UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width,kMainScreen_height - kMainTopHeight - 45) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.96 alpha:1.00];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
 
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    self.navTitle=@"个人中心";
    
    self.navLeftBtn.hidden = YES;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 1;
            break;

        case 1:
            return 1;
            break;
        case 2:
            return 1;
            break;
        case 3:
            return 1;
            break;
        case 4:
            return 1;
            break;
        default:
            return 0;
            break;
    }
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
   
    return [UIView new];
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return 0.01;
    }
    else
    {
        return 10;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
            return GTFixHeightFlaot(80);
    }
    else
    {
        return GTFixHeightFlaot(40);
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        MyTableViewCell *cell = [[MyTableViewCell alloc]init];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    else
    {
        MyDetailTableViewCell *cell = [[MyDetailTableViewCell alloc]init];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;

        switch (indexPath.section)
        {
            case 1:
                cell.iconImageView.image  = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.OneIconArray[indexPath.row]]];
                cell.TitleLabel.text = [NSString stringWithFormat:@"%@",self.OneTitleArray[indexPath.row]];
                if (indexPath.row==3)
                {
                    cell.lineView2.hidden = NO;
                    cell.lineView.hidden = YES;
                }

                break;
            case 2:
                cell.iconImageView.image  = [UIImage imageNamed:@"ico_fenxi_wode"];
                cell.TitleLabel.text = @"学情分析";
                if (indexPath.row ==0)
                {
                    cell.lineView2.hidden = NO;
                    cell.lineView.hidden = YES;
                }
                break;
            case 3:
                cell.iconImageView.image  = [UIImage imageNamed:[NSString stringWithFormat:@"%@",self.ThreeIconArray[indexPath.row]]];
                cell.TitleLabel.text = [NSString stringWithFormat:@"%@",self.threeTitleArray[indexPath.row]];
                if (indexPath.row ==1)
                {
                    cell.lineView2.hidden = NO;
                    cell.lineView.hidden = YES;
                }
                break;
            case 4:
                cell.iconImageView.image  = [UIImage imageNamed:@"ico_shezhi_wode"];
                cell.TitleLabel.text = @"设置";
                if (indexPath.row == 0)
                {
                    cell.lineView2.hidden = NO;
                    cell.lineView.hidden = YES;
                }
                break;
            default:
                break;
        }
        return cell;
    }

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    if (indexPath.section==0&&indexPath.row==0) {//个人信息
        PersonalinformationVC *vc = [PersonalinformationVC  new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.section==1&&indexPath.row==0) {//我的老师
        MyTeacherVC *vc = [MyTeacherVC  new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.section==1&&indexPath.row==1) {//我的家庭作业
        JiaTingZuoYeVC *vc = [JiaTingZuoYeVC  new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.section==1&&indexPath.row==2) {//题库复习
        TiKuFuXiVC *vc = [TiKuFuXiVC  new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.section==1&&indexPath.row==3) {//我的收藏
        WoDeShouCangVC *vc = [WoDeShouCangVC  new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.section==2&&indexPath.row==0) {//学情分析
       
        
    }else if (indexPath.section==3&&indexPath.row==0) {//vip信息
        VIPHuiYuanVC *vc=[VIPHuiYuanVC new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if (indexPath.section==3&&indexPath.row==1) {//积分兑换礼品
        
        
    }else if (indexPath.section==4&&indexPath.row==0) {//设置
        [self.navigationController pushViewController:[SheZhiVC new] animated:YES];
        
    }
 
}
@end
