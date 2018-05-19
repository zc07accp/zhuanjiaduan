//
//  BaseTabBarController.h
//  CustomProject
//
//  Created by mozhu on 17/3/9.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYLTabBarController.h"


#import "HomeVC.h"
#import "SecondVC.h"
#import "ThirdVC.h"
#import "FourVC.h"


typedef NS_ENUM(NSUInteger, TabBarTag) {
    TabBarTag_Home,
    TabBarTag_Second,
    TabBarTag_Third,
    TabBarTag_Four,
    
};

@interface BaseTabBarController : CYLTabBarController<UITabBarControllerDelegate>

@end
