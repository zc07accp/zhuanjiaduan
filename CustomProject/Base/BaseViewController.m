//
//  BaseViewController.m
//  CustomProject
//
//  Created by mozhu on 17/3/8.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "BaseViewController.h"
#import "HomeVC.h"
#import "BaseUtils.h"
#import "UIButoon+Style.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];

    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"loginout" object:nil];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [SVProgressHUD dismiss];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loginout) name:@"loginout" object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    self.extendedLayoutIncludesOpaqueBars=YES;
    self.navigationController.navigationBar.hidden=YES;
    //解决下移
    self.navigationController.navigationBar.translucent=NO;
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setMinimumDismissTimeInterval:3];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self setHideNavView];
    [self setHideLeftBtn];

    NSArray *viewcontrollers=self.navigationController.viewControllers;
    if (viewcontrollers.count>1)
    {
        if ([viewcontrollers objectAtIndex:viewcontrollers.count-1]==self)
        {
            //push方式
//           [self.navigationController popViewControllerAnimated:YES];
            self.navLeftBtn.hidden = NO;
        }
    }
    else{
        //present方式
//        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
        self.navLeftBtn.hidden = YES;
    }
}
-(UIButton *)navRightBtn
{
    if (!_navRightBtn) {
        _navRightBtn= [UIButton buttonWithFrame:CGRectZero withTitle:@"" withTitleColor:[UIColor whiteColor] withSize:15 image:nil target:self action:@selector(right_click:)];
        [self.navView addSubview:_navRightBtn];
        [_navRightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-15);
            make.centerY.equalTo(self.navView.mas_bottom).offset(-22);
            make.height.equalTo(self.navRightBtn.mas_height);
            make.width.equalTo(self.navRightBtn.mas_width);
        }];
    }
    return _navRightBtn;
}
-(void)setNavRightBtnTitle:(NSString *)navRightBtnTitle
{
    _navRightBtnTitle=navRightBtnTitle;
    if (_navRightBtnTitle.length) {
        [self.navRightBtn setTitle:navRightBtnTitle forState:UIControlStateNormal];
    }
}
-(void)setNavRightBtnImg:(NSString *)navRightBtnImg
{
    _navRightBtnImg=navRightBtnImg;
    if (_navRightBtnImg.length) {
        self.navRightBtn.frame=CGRectMake(kMainScreen_width-50, 31, kMainTopHeight-22, 18);
        [self.navRightBtn setImage:[UIImage imageNamed:_navRightBtnImg] forState:UIControlStateNormal];
        
    }
}
-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel=[UILabel labelWithframe:CGRectMake(kMainScreen_width/2-GTFixWidthFlaot(100), kMainTopHeight-44, GTFixWidthFlaot(200), 40) withSize:18 withColor:[AppStyleConfiguration ColorWithNavigationTitleColor] withText:@""];
        _titleLabel.textAlignment=NSTextAlignmentCenter;
         [self.navView addSubview:_titleLabel];
        
    }
    return _titleLabel;
}
-(void)setNavTitle:(NSString *)navTitle
{
    _navTitle=navTitle;
    if (_navTitle.length) {
        self.titleLabel.text=navTitle;
       
    }
}

-(void)setHideNavView
{
    if (![self respondsToSelector:@selector(set_noNavView)]) {
        self.navView=[UIView viewWithFrame:CGRectMake(0, 0, kMainScreen_width, kMainTopHeight) withbackGroudColor:[AppStyleConfiguration ColorWithMain]];
        [self.view addSubview:self.navView];
        UIView *lineView=[UIView viewWithFrame:CGRectMake(0, kMainTopHeight-0.8, kMainScreen_width, 0.8) withbackGroudColor:[AppStyleConfiguration ColorWithLineColor]];
        [self.navView addSubview:lineView];
    }
}

-(void)setHideLeftBtn
{
    if (![self respondsToSelector:@selector(set_noLeftButton)]) {
        if (!self.navLeftBtn) {
            self.navLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//            self.navLeftBtn.frame=CGRectMake(0, kMainTopHeight-34, 35, 22);
//            [self.navLeftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 12, 0, 0)];
            [self.navLeftBtn setImage:[UIImage imageNamed:@"ico_fanhui_all"] forState:UIControlStateNormal];
            [self.navLeftBtn setImage:[UIImage imageNamed:@"ico_fanhui_all"] forState:UIControlStateHighlighted];
            [self.navLeftBtn addTarget:self action:@selector(left_click:) forControlEvents:UIControlEventTouchUpInside];
            [self.navView addSubview:self.navLeftBtn];
            [self.navLeftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@15);
                make.centerY.equalTo(self.navView.mas_bottom).offset(-22);
                make.height.equalTo(self.navLeftBtn.mas_height);
                make.width.equalTo(self.navLeftBtn.mas_width);
            }];

        }
        
    }
}
#pragma mark -- left_button
-(void)left_click:(UIButton *)sender
{
    if ([self respondsToSelector:@selector(left_button_event:)]) {
        [self left_button_event:sender];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}
#pragma mark -- right_button

-(void)right_click:(id)sender
{
    if ([self respondsToSelector:@selector(right_button_event:)]) {
        [self right_button_event:sender];
    }
}

-(void)set_NavTitleView:(UIView *)view
{
    [self.navView addSubview:view];
}

-(void)loginout
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"该账号已在其他设备上登录，请重新登录" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction*alertActionConfirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [BaseUtils offline];
        
        [self.navigationController popToRootViewControllerAnimated:NO];
        
    }];
    
    [alert addAction:alertActionConfirm];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alert animated:YES completion:nil];
    });
    
}

@end
