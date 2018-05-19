//
//  HomeVC.m
//  CustomProject
//
//  Created by mozhu on 17/3/9.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "HomeVC.h"
#import "HomeView.h"
#import "ShareManager.h"
#import "HtmlVC.h"
#import "DLCustomSlideView.h"
#import "DLScrollTabbarView.h"
#import "DLSlideView.h"
#import "DLLRUCache.h"
#import "MessageListVC.h"
@interface HomeVC ()<DLSlideViewDelegate,DLSlideViewDataSource,BaseViewControllerDelegate>
@property(nonatomic,strong)HomeView *mainV;

@property(nonatomic,strong)DLSlideView *slideView;

@end

@implementation HomeVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navTitle = @"咨询订单";
//  [kAppWindow addSubview:[[NSClassFromString(@"LoginVC") alloc]initWithFrame:[UIScreen mainScreen].bounds]];
    UIViewController *vc = [[NSClassFromString(@"LoginVC") alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    self.navRightBtn.hidden = NO;
}

-(void)right_button_event:(UIButton *)sender{
    [ShareManager sharedInstance].title = @"分享标题";
    [ShareManager sharedInstance].descr = @"一个集社区服务、物业管理及社区购物为一体的综合型APP";
    [ShareManager sharedInstance].webpageUrl = @"";
    [ShareManager sharedInstance].thumbIamge = [UIImage imageNamed:@"logo"];
    [[ShareManager sharedInstance] showShareView];
}

-(void)DLSlideView:(DLSlideView *)slide didSwitchTo:(NSInteger)index
{
    
}
- (UIViewController *)DLSlideView:(DLSlideView *)sender controllerAt:(NSInteger)index
{
    UIViewController *vc =  [[UIViewController alloc]init];
    return vc;
    
}
-(void)left_button_event:(UIButton *)sender
{
    
    [self.navigationController pushViewController:[MessageListVC new] animated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    RootViewController*vc=(RootViewController*)kRootViewController;
    [vc.tabBarVC.tabBar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] ];
    [vc.tabBarVC.tabBar setShadowImage:[UIImage imageWithColor:[UIColor whiteColor]] ];
    
 
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    RootViewController*vc=(RootViewController*)kRootViewController;
    [vc.tabBarVC.tabBar setBackgroundImage:[UIImage imageNamed:@""]];
}
@end
