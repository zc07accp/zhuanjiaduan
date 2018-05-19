//
//  RootViewController.m
//  CustomProject
//
//  Created by mozhu on 17/5/2.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "RootViewController.h"
#import "WelcomeView.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTabBar];
    
    [self setWelcomeView];
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setMinimumDismissTimeInterval:2];
}
-(void)setTabBar
{
    self.tabBarVC=[[BaseTabBarController alloc]init];
    [self.view addSubview:self.tabBarVC.view];

}

-(void)setWelcomeView
{
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"FIRSTSTART"])
    {
        //满足条件,说明是第一次运行,然后用字典在沙盒中写入文件,并将值改为YES,项目以后再运行,读取到的值均为YES
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"FIRSTSTART"];
        
        //引导页图片数组
        NSArray *images =  @[[UIImage imageNamed:@"image1.jpg"],[UIImage imageNamed:@"image2.jpg"],[UIImage imageNamed:@"image3.jpg"],[UIImage imageNamed:@"image4.jpg"],[UIImage imageNamed:@"image5.jpg"]];
        //创建引导页视图
        WelcomeView *pageView = [[WelcomeView alloc]initWithFrame:self.view.frame WithImages:images];
        [self.view addSubview:pageView];
        
    }

}
@end
