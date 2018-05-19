//
//  YiBangDingCellVC.m
//  Zero
//
//  Created by 方涛 on 2018/4/28.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "YiBangDingCellVC.h"
#import "FourView.h"
#import "ChangeCellVC.h"

@interface YiBangDingCellVC ()
@property(nonatomic,strong)YiBangDingView *mainV;

@end

@implementation YiBangDingCellVC
-(YiBangDingView *)mainV{
    if (!_mainV) {
        kWeakSelf(self)
        _mainV=[[YiBangDingView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height-kMainTopHeight)];
        [_mainV.sureBtn addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
            [weakself.navigationController pushViewController:[ChangeCellVC new] animated:YES];
        }];
    }
    return _mainV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle=@"绑定手机号";
    [self.view addSubview:self.mainV];
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
