//
//  BaseViewController.h
//  CustomProject
//
//  Created by mozhu on 17/3/8.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+Color.h"
@protocol  BaseViewControllerDataSource<NSObject>

@optional
-(void)set_noNavView;
-(void)set_noLeftButton;
@end


@protocol BaseViewControllerDelegate <NSObject>

@optional
-(void)left_button_event:(UIButton*)sender;
-(void)right_button_event:(UIButton*)sender;
-(void)title_click_event:(UIView*)sender;
@end

@interface BaseViewController : UIViewController<BaseViewControllerDataSource,BaseViewControllerDelegate,UINavigationControllerDelegate>

@property(nonatomic,strong)UIView    *navView;
@property(nonatomic,strong)NSString  *navTitle;
@property(nonatomic,strong)NSString  *navRightBtnTitle;
@property(nonatomic,strong) UIButton *navLeftBtn;
@property(nonatomic,strong) UIButton *navRightBtn;
@property(nonatomic,strong) UILabel *titleLabel;
@property(nonatomic,strong)NSString *navRightBtnImg;
@end
