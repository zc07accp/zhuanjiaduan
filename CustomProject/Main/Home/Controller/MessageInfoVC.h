//
//  MessageInfoVC.h
//  CustomProject
//
//  Created by fei du on 2017/5/11.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "BaseViewController.h"

@interface MessageInfoVC : BaseViewController

@property (nonatomic, assign) NSInteger type;// 0：系统消息;1：购物消息；2：促销消息 3：免单通知

@property (nonatomic, strong) id  msgModel;

@end
