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

#import "StayConsultViewController.h"
@interface HomeVC ()<DLCustomSlideViewDelegate,BaseViewControllerDelegate>
@property(nonatomic,strong)HomeView *mainV;
@property(nonatomic,strong)DLScrollTabbarView *topTabBar;
@property(nonatomic,strong)DLCustomSlideView *slideView;
@property (nonatomic, strong) NSArray  *titleArray;

@end

@implementation HomeVC

-(NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = [NSArray arrayWithObjects:@"待咨询",@"待开方" ,nil];
    }
    return _titleArray;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navTitle = @"咨询订单";
//  [kAppWindow addSubview:[[NSClassFromString(@"LoginVC") alloc]initWithFrame:[UIScreen mainScreen].bounds]];
    UIViewController *vc = [[NSClassFromString(@"LoginVC") alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    self.navRightBtn.hidden = NO;
    [self configView];
}

-(void)configView
{
    DLLRUCache *cache = [[DLLRUCache alloc] initWithCount:2];
    self.slideView=[[DLCustomSlideView alloc] initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height - kMainTopHeight)];
    self.topTabBar= [[DLScrollTabbarView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, 40)];
    self.topTabBar.tabItemNormalColor = [UIColor blackColor];
    self.topTabBar.tabItemSelectedColor = [UIColor redColor];
    self.topTabBar.tabItemNormalFontSize = 15.0f;
    self.topTabBar.trackColor =[UIColor redColor];
    NSMutableArray *itmeArr=[[NSMutableArray alloc]init];

    for (int i=0; i<self.titleArray.count; i++)
    {
        [itmeArr addObject:[DLScrollTabbarItem itemWithTitle:self.titleArray[i] width:self.view.frame.size.width/self.titleArray.count]];
    }
    self.topTabBar.tabbarItems = itmeArr;
    self.slideView.tabbar = self.topTabBar;
    self.slideView.cache = cache;
    self.slideView.selectedIndex = 0;
    [self.slideView setup];
    self.slideView.delegate = self;
    self.slideView.baseViewController = self;
    [self.view addSubview:self.slideView];
}
-(void)right_button_event:(UIButton *)sender{
    [ShareManager sharedInstance].title = @"分享标题";
    [ShareManager sharedInstance].descr = @"一个集社区服务、物业管理及社区购物为一体的综合型APP";
    [ShareManager sharedInstance].webpageUrl = @"";
    [ShareManager sharedInstance].thumbIamge = [UIImage imageNamed:@"logo"];
    [[ShareManager sharedInstance] showShareView];
}


- (UIViewController *)DLCustomSlideView:(DLCustomSlideView *)sender controllerAt:(NSInteger)index {

    StayConsultViewController *vc =  [[StayConsultViewController alloc]init];

    return vc;
}


- (NSInteger)numberOfTabsInDLCustomSlideView:(DLCustomSlideView *)sender {

    return self.titleArray.count;
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
