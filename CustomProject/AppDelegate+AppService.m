//
//  AppDelegate+AppService.m
//  CustomProject
//
//  Created by mozhu on 2017/11/8.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "AppDelegate+AppService.h"
#import "RootViewController.h"
#import "SYSafeCategory.h"
#import "MapLocationManager.h"
#import "OpenUDID.h"
#import "BaseNavController.h"
#import "LoginVC.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import "weixin/WXApi.h"
static NSString * networkState = @"当前网络不可用，请检查您的网络设置";

@implementation AppDelegate (AppService)
-(void)initService{
    //注册登录状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(loginStateChange:)
                                                 name:KNotificationLoginStateChange
                                               object:nil];
    
    //网络状态监听
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(netWorkStateChange:)
                                                 name:KNotificationNetWorkStateChange
                                               object:nil];
}

#pragma mark ————— 初始化window —————
-(void)initWindow{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    if (@available(iOS 11.0, *)){
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
    [self.window makeKeyAndVisible];
    
 
}

#pragma mark ————— 初始化用户系统 —————
-(void)initUserManager{
    NSLog(@"设备IMEI ：%@",[OpenUDID value]);

    if([userManager loadUserInfo]){
    
        
        //如果有本地数据，先展示TabBar 随后异步自动登录
        RootViewController *rootVC = [[RootViewController alloc] init];
        self.window.rootViewController=rootVC;

        
    }else{
        //没有登录过，展示登录页面
//        KPostNotification(KNotificationLoginStateChange, @NO)
        //        [MBProgressHUD showErrorMessage:@"需要登录"];
        
//        CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
//        CYLTabBarController *tabBarController = tabBarControllerConfig.tabBarController;
        RootViewController *rootVC = [[RootViewController alloc] init];
        self.window.rootViewController=rootVC;
    }
    
    
}
#pragma mark ————— 网络状态监听 —————
- (void)monitorNetworkStatus
{
    [BaseHttp MonitorNetwork];
}

#pragma mark ————— 友盟 初始化 —————

-(void)initUMeng{
    /* 打开调试日志 */
    [[UMSocialManager defaultManager] openLog:YES];
    
    /* 设置友盟appkey */
    [[UMSocialManager defaultManager] setUmSocialAppkey:UMengKey];
    
    [self configUSharePlatforms];
}
#pragma mark ————— 配置第三方 —————
-(void)configUSharePlatforms{
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:kAppKey_Wechat appSecret:kSecret_Wechat redirectURL:nil];
    /*
     * 移除相应平台的分享，如微信收藏
     */
    //[[UMSocialManager defaultManager] removePlatformProviderWithPlatformTypes:@[@(UMSocialPlatformType_WechatFavorite)]];
    
    /* 设置分享到QQ互联的appID
     * U-Share SDK为了兼容大部分平台命名，统一用appKey和appSecret进行参数设置，而QQ平台仅需将appID作为U-Share的appKey参数传进即可。
     */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:kAppKey_Tencent/*设置QQ平台的appID*/  appSecret:nil redirectURL:nil];

    TencentOAuth *tencentOAuth = [[TencentOAuth alloc] initWithAppId:@"222222"  andDelegate:self];//QQ 登录初始化
    [WXApi registerApp:@""];

}
 #pragma mark ————— 统一处理nil插入会引起闪退 —————
-(void)safeCategory
{
    [SYSafeCategory callSafeCategory];
}

 #pragma mark ————— tabBarItem属性 —————
-(void)customizeInterface
{
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [AppStyleConfiguration ColorWithBottomTabBarUnSelectColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] =[AppStyleConfiguration ColorWithBottomTabBarSelectColor];
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    //    // 设置背景图片
    //    UITabBar *tabBarAppearance = [UITabBar appearance];
    //    [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@"tabbar_background"]];
}

 #pragma mark ————— 键盘收回管理 —————
-(void)configureBoardManager
{
    /**
     *  键盘处理
     */
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;//控制整个功能是否启用
    manager.enableAutoToolbar = NO;//是否展示工具条
    manager.shouldResignOnTouchOutside = YES; //控制点击背景是否收起键盘
    
}
 #pragma mark ————— 系统自带定位 —————
-(void)startLocation
{
    [[MapLocationManager shareInstance]startSystemLocationWithRes:^(CLLocation *loction, NSError *error) {
        NSLog(@"系统自带定位信息：%f,%f",loction.coordinate.latitude,loction.coordinate.longitude);
    }];
    
    //创建编码对象
    CLGeocoder *geocoder=[[CLGeocoder alloc]init];
    [geocoder geocodeAddressString:@"杭州市滨江区高新软件园" completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        // CLPlacemark : 地标
        // location : 位置对象
        // addressDictionary : 地址字典
        // name : 地址详情
        // locality : 城市
        
        if(error == nil)
        {
            CLPlacemark *pl = [placemarks firstObject];
            NSLog(@"%@--%@---%@", pl.name,@(pl.location.coordinate.latitude).stringValue,@(pl.location.coordinate.longitude).stringValue);
            
            
        }else
        {
            NSLog(@"错误");
        }
    }];
    
}
#pragma mark ————— OpenURL 回调 —————
// 支持所有iOS系统
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    if (!result)
    {
        // 其他如支付等SDK的回调
    }

    return result;
}


#pragma mark ————— 登录状态处理 —————
- (void)loginStateChange:(NSNotification *)notification
{
    BOOL loginSuccess = [notification.object boolValue];
    
    if (loginSuccess) {//登陆成功加载主窗口控制器
        
        [[self getCurrentUIVC] dismissViewControllerAnimated:YES completion:nil];
        
    }else {//登陆失败加载登陆页面控制器
        
        BaseNavController *loginNavi =[[BaseNavController alloc] initWithRootViewController:[LoginVC new]];
        
        [[self getCurrentUIVC] presentViewController:loginNavi animated:YES completion:nil];
        
    }
    
}
#pragma mark ————— 网络状态变化 —————
- (void)netWorkStateChange:(NSNotification *)notification
{
    BOOL isNetWork = [notification.object boolValue];
    
    if (isNetWork) {//有网络
        
        
    }else {//登陆失败加载登陆页面控制器
        [MBProgressHUD showTopTipMessage:networkState isWindow:YES];
    }
}

 #pragma mark ————— 当前顶层控制器 —————
-(UIViewController *)getCurrentVC{
    
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

-(UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [self getCurrentVC];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }else
        if ([superVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)superVC).viewControllers.lastObject;
        }
    return superVC;
}
+ (AppDelegate *)shareAppDelegate{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}
@end
