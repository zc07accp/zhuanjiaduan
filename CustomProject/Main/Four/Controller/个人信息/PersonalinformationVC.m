//
//  PersonalinformationVC.m
//  Zero
//
//  Created by zf on 2018/4/23.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "PersonalinformationVC.h"
#import "MyTableViewCell.h"
#import "GeRenTouxiangVC.h"
#import "XiuGaiViewController.h"
#import "NianJiViewController.h"
#import "XingBieViewController.h"
#import "DiZhiViewController.h"
@interface PersonalinformationVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *OneTitleArray;


@property (nonatomic, strong) NSArray *TwoTitleArray;
@end

@implementation PersonalinformationVC
-(UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width,kMainScreen_height - kMainTopHeight) style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.96 alpha:1.00];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
-(NSArray *)OneTitleArray
{
    if (!_OneTitleArray)
    {
        _OneTitleArray =[NSArray arrayWithObjects:@"头像",@"昵称",@"性别", nil];

    }
    return _OneTitleArray;
}


-(NSArray *)TwoTitleArray
{
    if (!_TwoTitleArray)
    {
        _TwoTitleArray =[NSArray arrayWithObjects:@"年级",@"城市",@"学校", nil];

    }
    return _TwoTitleArray;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navTitle=@"个人信息";
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 3;
            break;

        case 1:
            return 3;
            break;
        default:
            return 0;
            break;
    }
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView  *View = [[UIView alloc]init];
    View.backgroundColor = self.tableView.backgroundColor;
    return View;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return 0.01;
    }
    else
    {
        return 15;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return GTFixHeightFlaot(50);
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonalInformationCell *cell = [[ PersonalInformationCell alloc]init];

    if (indexPath.section ==0)
    {

        cell.TitleLabel.text =self.OneTitleArray[indexPath.row];
    }
    else
    {
         cell.TitleLabel.text =self.TwoTitleArray[indexPath.row];
    }
    if (indexPath.row ==0&&indexPath.section ==0 )
    {
        cell.headerImageView.hidden = NO;
        cell.ContentLable. hidden = YES;
    }
    else
    {
        cell.headerImageView.hidden = YES;
    }
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        switch (indexPath.row)
        {
            case 0:
            {
                GeRenTouxiangVC *vc = [GeRenTouxiangVC new];
                [self.navigationController pushViewController: vc animated:YES];
            }

                break;
            case 1:
            {
                XiuGaiViewController *vc = [XiuGaiViewController new];
                vc.titleStr = @"昵称";
                [self.navigationController pushViewController: vc animated:YES];
            }
                break;
            case 2:
            {
                XingBieViewController *vc = [XingBieViewController new];

                [self.navigationController pushViewController: vc animated:YES];
            }

                break;

            default:
                break;
        }
    }
    else
        {
            switch (indexPath.row)
            {
                case 0:
                {
                    NianJiViewController *vc = [NianJiViewController new];
                    [self.navigationController pushViewController: vc animated:YES];
                }

                    break;
                case 1:
                {
                    DiZhiViewController *vc = [DiZhiViewController new];

                    [self.navigationController pushViewController: vc animated:YES];
                }
                    break;
                case 2:
                {
                    XiuGaiViewController *vc = [XiuGaiViewController new];
                    vc.titleStr = @"学校";
                    [self.navigationController pushViewController: vc animated:YES];
                }
                    break;

                default:
                    break;
            }

        }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
