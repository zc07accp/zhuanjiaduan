
//
//  MyTeacherVC.m
//  Zero
//
//  Created by 方涛 on 2018/4/25.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "MyTeacherVC.h"
#import "FourView.h"
#import "AddTeacherVC.h"//扫码绑定教师

@interface MyTeacherVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIButton *saoMaBtn;//扫码

@end

@implementation MyTeacherVC
-(UIButton *)saoMaBtn{
    if (!_saoMaBtn) {
        _saoMaBtn=[UIButton buttonWithTitle:@"" withImageName:@"ico_saomiao_laoshi" withBGColor:[UIColor clearColor] Withlayer:NO];
        [self.view addSubview:_saoMaBtn];
        [_saoMaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(@0);
            make.centerY.equalTo(self.view.mas_bottom).offset(-75);
            make.height.equalTo(self.saoMaBtn.mas_height);
            make.width.equalTo(self.saoMaBtn.mas_width);
        }];
        [_saoMaBtn addTarget:self action:@selector(saoMaBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _saoMaBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[AppStyleConfiguration ColorWithBaseBoard];
    self.navTitle=@"我的老师";
    [self saoMaBtn];
    
}

#pragma mark tableView 代理方法
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height-kMainTopHeight-150) style:UITableViewStyleGrouped];;
        _tableView.backgroundColor=[AppStyleConfiguration ColorWithBaseBoard];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.estimatedRowHeight=80;
        [_tableView registerClass:[MyTeacherCell0 class] forCellReuseIdentifier:@"MyTeacherCell0"];
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTeacherCell0 *cell=[tableView dequeueReusableCellWithIdentifier:@"MyTeacherCell0"];
   
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
-(void)saoMaBtnClick:(UIButton*)sender{
    [self.navigationController pushViewController:[AddTeacherVC new] animated:YES];
}

@end
