//
//  MessageInfoVC.m
//  CustomProject
//
//  Created by fei du on 2017/5/11.
//  Copyright © 2017年 puyue.com. All rights reserved.
//

#import "MessageInfoVC.h"
#import "MineUtils.h"

@interface MessageInfoVC ()

//@property (nonatomic, strong) UILabel *topLabel;
@property (nonatomic, strong) UILabel *infoLabel;
@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) MsgUtils *msgUtils;
@end

@implementation MessageInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    switch (self.type) {
        case 0:
            self.navTitle = @"系统通知";
            break;
        case 1:
            self.navTitle = @"购物通知";
            break;
        case 2:
            self.navTitle = @"促销通知";
            break;
        case 3:
            self.navTitle = @"免单通知";
            break;
        default:
            break;
    }
    self.view.backgroundColor = [UIColor whiteColor];
}


@end
