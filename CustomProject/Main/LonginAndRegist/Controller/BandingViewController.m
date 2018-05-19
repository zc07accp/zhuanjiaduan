//
//  BandingViewController.m
//  Zero
//
//  Created by zf on 2018/4/3.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "BandingViewController.h"
#import "LoginView.h"
@interface BandingViewController ()
@property(nonatomic,strong)ForgetView *forgetV;
@end

@implementation BandingViewController
-(ForgetView *)forgetV{
    if (!_forgetV) {
        _forgetV=[[ForgetView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height-kMainTopHeight)];
        [_forgetV.sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_forgetV.codeTF.codeBtn addTarget:self action:@selector(codeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
