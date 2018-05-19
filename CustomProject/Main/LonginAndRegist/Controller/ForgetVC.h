//
//  ForgetVC.h
//  CustomProject
//
//  Created by 方涛 on 2017/5/11.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "BaseViewController.h"
typedef void (^popBoardBlock)(id data);

@interface ForgetVC : BaseViewController
@property(nonatomic,copy)popBoardBlock pBlock;

@end
