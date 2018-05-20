//
//  StayConsultViewController.m
//  Zero
//
//  Created by xingzi on 2018/5/20.
//  Copyright © 2018年 puyue.com. All rights reserved.
//  待咨询

#import "StayConsultViewController.h"
#import "StayConsultCell.h"

@interface StayConsultViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation StayConsultViewController
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kMainScreen_width,kMainScreen_height - kMainBottomHeight - kMainTopHeight - 45) style:1];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.tableFooterView=[UIView new];
        _tableView.showsVerticalScrollIndicator = NO;

        _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[StayConsultCell class] forCellReuseIdentifier:@"StayConsultCell"];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    StayConsultCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StayConsultCell"];
    if (!cell)
    {
        cell = [[StayConsultCell alloc]initWithStyle:2 reuseIdentifier:@"StayConsultCell"];
    }
    cell.backgroundColor = [UIColor redColor];
    return cell;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navView.hidden = YES;
    
}

-(void)viewWillAppear:(BOOL)animated
{

    [self.view addSubview:self.tableView];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
