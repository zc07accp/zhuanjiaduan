
//
//  ChongZhiPwdVC.m
//  Zero
//
//  Created by 方涛 on 2018/4/28.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "ChongZhiPwdVC.h"
#import "FourView.h"

@interface ChongZhiPwdVC ()
@property(nonatomic,strong)ChongZhiPwdView *mainV;

@end

@implementation ChongZhiPwdVC
-(ChongZhiPwdView *)mainV{
    if (!_mainV) {
        _mainV=[[ChongZhiPwdView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height-kMainTopHeight)];
    }
    return _mainV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle=@"重置密码";
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
