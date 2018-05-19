//
//  BaseTabBarController.m
//  CustomProject
//
//  Created by mozhu on 17/3/9.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavController.h"

@implementation BaseTabBarController

-(instancetype)init
{
    self=[super init];
    if (self) {
         [self setupTabBarController];        
        //显示未读
//        UINavigationController  *secondNav =(UINavigationController *)self.viewControllers[1];
//        UITabBarItem *curTabBarItem=secondNav.tabBarItem;
//        [curTabBarItem setBadgeValue:@"2"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}


-(void)setupTabBarController
{
    NSArray *vcArray = @[@"HomeVC",
                         @"FourVC"];
    NSArray *titleArr = @[@"咨询订单",@"个人中心"];
    NSArray *imageArr = @[@"ico_paiti_shouye",@"ico_wode_shouye"];
    NSArray *selectedImageArr = @[@"ico_paiti_shouye_s",@"ico_wode_shouye_s"];
    NSMutableArray *vcs = [[NSMutableArray alloc]init];
    NSMutableArray *tabItems = [[NSMutableArray alloc]init];
    
    for (int i=0;i<titleArr.count;i++) {
        BaseViewController *vc = [[NSClassFromString(vcArray[i]) alloc]init];
        BaseNavController *nav=[[BaseNavController alloc]initWithRootViewController:vc];
        nav.view.tag=i;
        [vcs addObject:nav];

        NSDictionary *tabBarItemsAttributes = @{
                                                     CYLTabBarItemTitle : titleArr[i],
                                                     CYLTabBarItemImage : imageArr[i],
                                                     CYLTabBarItemSelectedImage : selectedImageArr[i],
                                                     };
        [tabItems addObject:tabBarItemsAttributes];
    
    }

    /// 设置TabBar属性数组
    self.tabBarItemsAttributes =tabItems;
    
    /// 设置控制器数组
    self.viewControllers =vcs;
    
    self.delegate = self;
    
}



#pragma mark - UITabBarControllerDelegate
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    /// 特殊处理 - 是否需要登录
    
    if (viewController.view.tag ==TabBarTag_Second) {
        NSLog(@"你点击了TabBar第二个");
        //        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:[UIViewController new]];
        //        [self presentViewController:nav animated:YES completion:nil];
        //        return NO;
    }
    return YES;
}

@end
