//
//  XingBieViewController.m
//  Zero
//
//  Created by zf on 2018/4/27.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "XingBieViewController.h"
#import "MyTableViewCell.h"
@interface XingBieViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation XingBieViewController
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    XingBieCell *cell = [[XingBieCell alloc]init];
    switch (indexPath.row) {
        case 0:
            cell.TitleLabel.text = @"男";

            break;
        case 1:
            cell.TitleLabel.text = @"女";
            cell.lineView3 .hidden = YES;
            cell.lineView.hidden = YES;
            cell.lineView2.hidden = NO;
            break;

        default:
            break;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


    if (indexPath.row==0)
    {
        XingBieCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];

        cell.checkImagView.hidden = NO;
        XingBieCell *cell1 = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];

        cell1.checkImagView.hidden = YES;
    }
    else
    {
        XingBieCell *cell1 = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];

        cell1.checkImagView.hidden = NO;
        XingBieCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];

         cell.checkImagView.hidden = YES;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navRightBtn setTitle:@"完成" forState:0];


    [self.navRightBtn setTitleColor:[UIColor blackColor] forState:0];
    [self.view addSubview:self.tableView];
kWeakSelf(self)
    [self.navRightBtn addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer)

    {

        XingBieCell *cell = [weakself.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];

        XingBieCell *cell1 = [weakself.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];

        if (cell.checkImagView.hidden)
        {

        }
        if (cell1.checkImagView.hidden)
        {

        }

    }];


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
