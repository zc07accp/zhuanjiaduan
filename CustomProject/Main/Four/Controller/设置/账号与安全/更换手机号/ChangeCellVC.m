
//
//  ChangeCellVC.m
//  Zero
//
//  Created by 方涛 on 2018/4/28.
//  Copyright © 2018年 puyue.com. All rights reserved.
//

#import "ChangeCellVC.h"
#import "FourView.h"
#import "UIButton+CountDown.h"
@interface ChangeCellVC ()
@property(nonatomic,strong)ChangeCellView *mainV;

@end

@implementation ChangeCellVC
-(ChangeCellView *)mainV{
    if (!_mainV) {
        _mainV=[[ChangeCellView alloc]initWithFrame:CGRectMake(0, kMainTopHeight, kMainScreen_width, kMainScreen_height-kMainTopHeight)];
        [_mainV.codeTF.codeBtn addTarget:self action:@selector(codeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mainV;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navTitle=@"更换手机号";
    [self.view addSubview:self.mainV];
}
-(void)codeBtnClick:(UIButton*)sender{//
    [sender DaiJiShiStartTime:60 title:@"重新获取" TitleColor:[UIColor blueColor] waitTittle:@"秒后重发" WaitTittleColor:[AppStyleConfiguration ColorWithTextTwo] enableColor:nil startColor:nil];

}
@end
