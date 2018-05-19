
//
//  VIPHuiYuanVC.m
//  Zero
//
//  Created by 方涛 on 2018/4/27.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "VIPHuiYuanVC.h"
#import "FourView.h"

@interface VIPHuiYuanVC ()
@property(nonatomic,strong)VIPHUiYuanView *mainV;
@property(nonatomic,strong)NSMutableArray *dataSource;

@end

@implementation VIPHuiYuanVC
-(NSMutableArray *)dataSource
{
    
    if (!_dataSource ) {
        _dataSource = [NSMutableArray arrayWithArray:@[@"30天",@"90天",@"120天"]] ;
    }
    return _dataSource;
}
-(VIPHUiYuanView *)mainV{
    if (!_mainV) {
        _mainV=[[VIPHUiYuanView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height-kMainTopHeight)];
    }
    return _mainV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[AppStyleConfiguration ColorWithBaseBoard];
    self.navView.backgroundColor=[UIColor clearColor];
    self.navTitle=@"VIP会员";
    self.navRightBtnImg=@"ico_wenti_shouye";
    [self.view addSubview:self.mainV];
    [self.mainV loadViewDataWithModel:nil];
    
}
-(void)right_button_event:(UIButton *)sender{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:@"非会员可导入管理50道错题，会员则无数量限制且可查看和下载打印类似乎题"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction* sureBtn = [UIAlertAction actionWithTitle:@"知道了！" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                           
                                                         }];
    
    [alert addAction:sureBtn];
    [self presentViewController:alert animated:YES completion:nil];
}


@end
