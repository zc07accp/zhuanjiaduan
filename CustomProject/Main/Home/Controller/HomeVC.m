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
#import "StayPrescribeViewController.h"
@interface HomeVC ()<DLCustomSlideViewDelegate,BaseViewControllerDelegate>
@property(nonatomic,strong)HomeView *mainV;
@property(nonatomic,strong)DLScrollTabbarView *topTabBar;
@property(nonatomic,strong)DLCustomSlideView *slideView;
@property (nonatomic, strong) NSArray  *titleArray;
@end
@implementation HomeVC



-(DLCustomSlideView *)slideView
{
    if (!_slideView) {
        DLLRUCache *cache = [[DLLRUCache alloc] initWithCount:self.titleArray.count];
        _slideView=[[DLCustomSlideView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height-kMainTopHeight)];
        _slideView.tabbar = self.topTabBar;
        _slideView.cache = cache;
        [_slideView setup];
        _slideView.delegate=self;
        _slideView.baseViewController = self;
        _slideView.selectedIndex=0;
    }
    return _slideView;
}
-(DLScrollTabbarView *)topTabBar
{
    if (!_topTabBar) {

        _topTabBar=[[DLScrollTabbarView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, 40)];
        _topTabBar.tabItemNormalColor = [UIColor blackColor];
        _topTabBar.tabItemSelectedColor = [UIColor redColor];
        _topTabBar.tabItemNormalFontSize = 15.0f;
        _topTabBar.trackColor =[UIColor redColor];
        _topTabBar.backgroundColor = [UIColor whiteColor];
        _topTabBar.trackColor = [AppStyleConfiguration ColorWithMain];
        NSMutableArray *itmeArr=[[NSMutableArray alloc]init];

        for (int i=0; i<self.titleArray.count; i++)
        {
            [itmeArr addObject:[DLScrollTabbarItem itemWithTitle:self.titleArray[i] width:self.view.frame.size.width/self.titleArray.count]];
        }
        _topTabBar.tabbarItems = itmeArr;
    }
    return _topTabBar;
}

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
//    UIViewController *vc = [[NSClassFromString(@"LoginVC") alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
    self.navRightBtn.hidden = NO;
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

    if (index==1)
    {
        StayPrescribeViewController *vc = [[StayPrescribeViewController alloc]init];//待开方
        return vc;
    }
    else
    {
        StayConsultViewController *vc =  [[StayConsultViewController alloc]init];//待咨询
        
         return vc;
    }

}


-(void)DLCustomSlideView:(DLCustomSlideView *)sender didSelectedAt:(NSInteger)index
{
    //    self.navTitle = self.titleArr[index][@"categoryName"];

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
