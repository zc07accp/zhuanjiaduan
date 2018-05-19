//
//  ForgetTwoVC.m
//  Zero
//
//  Created by zf on 2018/4/3.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "ForgetTwoVC.h"
#import "LoginView.h"
#import "RegistDetailVC.h"
@interface ForgetTwoVC ()
@property(nonatomic,strong)ForgetTwoView *forgetV;
@end

@implementation ForgetTwoVC
-(ForgetTwoView *)forgetV{
    if (!_forgetV) {
        _forgetV=[[ForgetTwoView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height-kMainTopHeight)];
        [_forgetV.sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _forgetV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.type isEqualToString:@"注册"])
    {
         [self setNavTitle:@"设置密码"];
    }else
    {
        [self setNavTitle:@"重置密码"];
    }

    [self.view addSubview: self.forgetV];
}
-(void)sureBtnClick:(UIButton*)sender
{

    if ([self.type isEqualToString:@"注册"])
    {
        [self.navigationController pushViewController:[RegistDetailVC new] animated:YES];
    }
    else
    {
        
    }
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
