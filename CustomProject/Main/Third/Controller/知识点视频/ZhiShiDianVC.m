
//
//  ZhiShiDianVC.m
//  Zero
//
//  Created by 方涛 on 2018/4/24.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "ZhiShiDianVC.h"
#import "ThirdView.h"
#import "SearchVC.h"

@interface ZhiShiDianVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)ThirdChooseView *mainV;


@end

@implementation ZhiShiDianVC
-(ThirdChooseView *)mainV{
    if (!_mainV) {
        _mainV=[[ThirdChooseView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height-kMainTopHeight)];
        _mainV.tableView.delegate=self;
        _mainV.tableView.dataSource=self;
        [_mainV.tableView registerClass:[ZhiShiDianCell0 class] forCellReuseIdentifier:@"ZhiShiDianCell0"];
        _mainV.tableView.estimatedRowHeight=80;
        _mainV.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;

        [_mainV.nianJiBtn addTarget:self action:@selector(nianJiBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_mainV.keMuBtn addTarget:self action:@selector(keMuBtnClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _mainV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle=@"知识点课堂";
    self.navRightBtnImg=@"ico_sousuo";
    [self.view addSubview:self.mainV];
}
-(void)right_button_event:(UIButton *)sender{
    [self.navigationController pushViewController:[SearchVC new] animated:YES];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 50;
//}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZhiShiDianCell0 *cell=[tableView dequeueReusableCellWithIdentifier:@"ZhiShiDianCell0"];
   
    return cell;
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ZhiShiDianHeadView *headV=[[ZhiShiDianHeadView alloc]initWithFrame:CGRectMake(0, 0, kMainScreen_width, 30)];
    headV.titLab.text=@"共找到194门课程";
    return headV;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return [UIView new];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}
-(void)nianJiBtnClick:(UIButton*)sender{
    if (sender.selected==YES) {
        self.mainV.chooseType=@"0";
    }else{
        self.mainV.chooseType=@"1";
    }
}
-(void)keMuBtnClick:(UIButton*)sender{
    if (sender.selected==YES) {
        self.mainV.chooseType=@"0";

    }else{
        self.mainV.chooseType=@"2";

    }
}
@end
