

//
//  DiZhiViewController.m
//  Zero
//
//  Created by zf on 2018/4/27.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "DiZhiViewController.h"
#import "MyTableViewCell.h"
#import "DiZhiCityViewController.h"
@interface DiZhiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation DiZhiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle = @"设置地区";
    [self.navRightBtn setTitle:@"完成" forState:0];
    [self.navRightBtn setTitleColor:[UIColor blackColor] forState:0];
    [self.view addSubview:self.tableView];

}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height-kMainTopHeight) style:UITableViewStyleGrouped];;
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.backgroundColor=[UIColor colorWithRed:0.93 green:0.93 blue:0.96 alpha:1.00];
        _tableView.separatorColor=[AppStyleConfiguration ColorWithBaseBoard];
        [self.view addSubview:_tableView];

    }
    return _tableView;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 2;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{


    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(GTFixWidthFlaot(15), 0, kMainScreen_width, 40)];

    view.backgroundColor = self.tableView.backgroundColor;

    UILabel *label = [UILabel labelWithSize:[UIFont systemFontOfSize:13] withColor:[UIColor colorWithRed:0.49 green:0.49 blue:0.50 alpha:1.00] withText:@"测试"];
    label.frame = view.frame;
    [view addSubview:label];
    if(section==0)
    {
        label.text = @"定位到的地址";
    }
    else
    {
        label.text = @"全部";
    }

    return view;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    else
    {
        return 10;
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        DizhiShengYiXuanZeCell *cell = [[DizhiShengYiXuanZeCell alloc]init];
        return cell;
    }
    else
    {

        DizhiShengCell *cell  =[DizhiShengCell new];
        return cell;
    }


}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DiZhiCityViewController *vc = [DiZhiCityViewController new];

    vc.sheng = @"浙江";
    [vc GetCity:^(NSString *city) {

        NSLog(@"%@",city);


        NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];

        DizhiShengYiXuanZeCell *cell = [self.tableView cellForRowAtIndexPath:path];
        cell.TitleLabel.text = [NSString stringWithFormat:@"中国 %@",city];

        NSArray <NSIndexPath *> *indexPathArray = @[path];

//        [self.tableView reloadRowsAtIndexPaths:indexPathArray withRowAnimation:0];
    }];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
