//
//  AddTeacherVC.h
//  Zero
//
//  Created by 方涛 on 2018/4/25.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "BaseViewController.h"

@interface AddTeacherVC : BaseViewController
@property (nonatomic,strong) UIViewController *controller;

@property (nonatomic, copy) void (^ScanSuncessBlock) (AddTeacherVC *,NSString *);//扫描结果
@end
